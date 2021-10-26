#include <stdlib.h>
#include "myLib.h"
#include "game.h"
// including sprites
#include "granny.h"
#include "teslaDown.h"
#include "teslaUp.h"
#include "time.h"
#include "heart.h"

// variables
PLAYER granny;
TESLA teslas[TESLACOUNT];
TESLA teslasOpp[TESLAOPPCOUNT];
int grannyLives;
int hasDec;
int timeCollected;
int heartCollected;
int flag;

void initGame() {
	initGranny();
	initTeslas();
	initTeslasOpp();

	grannyLives = 3;
	timeCollected = 0;
	heartCollected = 0;
	flag = 1;

	unsigned short colors[NUMCOLORS] = {BEIGE, LIGHTBLUE, DARKBLUE, TEAL, ORANGE, GRAY1, GRAY2, GRAY3, WHITE, GRAY};

	// load granny colors
	DMANow(3, grannyPal, PALETTE, grannyPalLen / 2);

	for (int i = 0; i < NUMCOLORS; i++) {
			PALETTE[256-NUMCOLORS+i] = colors[i];
	}
}

void updateGame() {
	updateGranny();

	// update teslas
	hasDec = 0;
	for (int i = 0; i < TESLACOUNT; i++) {
		updateTesla(&teslas[i]);
	}
	for (int i = 0; i < TESLAOPPCOUNT; i++) {
		updateTeslaOpp(&teslasOpp[i]);
	}
	if (hasDec) {
		grannyLives--;
	}
	if (heartCollected && flag) {
		grannyLives++;
		flag = 0;
	}
}

void drawGame() {
	fillScreen4(GRAYID);

	drawGranny();

	if (!timeCollected) {
		drawClock(90, 30); 
	}

	if (!heartCollected) {
		drawHeart(145, 80);
	}

	// draw teslas
	for (int i = 0; i < TESLACOUNT; i++) {
		drawTesla(&teslas[i]);
	}
	for (int i = 0; i < TESLAOPPCOUNT; i++) {
		drawTeslaOpp(&teslasOpp[i]);
	}

}

void initGranny() {
	granny.row = 130;
	granny.col = 210;
	granny.cdel = 2;
	granny.height = 28;
	granny.width = 28;
}

void updateGranny() {
	//moving granny
	if (BUTTON_HELD(BUTTON_LEFT) && granny.col >= granny.cdel) {
		granny.col -= granny.cdel;
	} 
	else if (BUTTON_HELD(BUTTON_RIGHT) && granny.col + granny.width - 1 < SCREENWIDTH - granny.cdel) {
		granny.col += granny.cdel;
	} 
	else if (BUTTON_HELD(BUTTON_UP) && granny.row >= granny.cdel) {		 
		granny.row -= granny.cdel;
	} 
	else if (BUTTON_HELD(BUTTON_DOWN) && granny.row + granny.height - 1 < SCREENHEIGHT - granny.cdel) {
		granny.row += granny.cdel;
	}

	if (collision(granny.col, granny.row, granny.width, granny.height, 90, 30, 28, 28)) {
		timeCollected = 1;
	}
	if (collision(granny.col, granny.row, granny.width, granny.height, 145, 80, 28, 28)) {
		heartCollected = 1;
	}
	
}

void drawGranny() {
	drawImage4(granny.col, granny.row, granny.width, granny.height, grannyBitmap);
}

void drawClock(int col, int row) {
	drawImage4(col, row, 28, 28, timeBitmap);
}

void drawHeart(int col, int row) {
	drawImage4(col, row, 28, 28, heartBitmap);
}

void initTeslas() {
	for (int i = 0; i < TESLACOUNT; i++) {
		if (i % 2 == 0) {
			teslas[i].col = 180;
		} else {
			teslas[i].col = 70;
		}
		teslas[i].row = 0;
		teslas[i].rdel = 2;
		teslas[i].cdel = 2;
		teslas[i].active = 1;
		teslas[i].isTesla = 1;
		teslas[i].height = 28;
		teslas[i].width = 28;
		teslas[i].skipFrames = 0;
	}
}

void updateTesla(TESLA* t) {
	if (t->active) {
		t->skipFrames++;
		if (!timeCollected) {
			t->row += t->rdel;
		}
		if (t->skipFrames % 2 == 0) {
			t->row += t->rdel;
			t->skipFrames = 0;
		}

		if (t->row + t->height-1 >= 160) {
			if (t->col == 180) {
				t->col = 180;
			} else {
				t->col = 70;
			}
			t->row = 0;
		}

		if (t->active && collision(granny.col, granny.row, granny.width, granny.height, t->col, t->row, t->width, t->height)) {
			t->active = 0;
			hasDec = 1;
		}
	}
	if (!(t->active)) {
		t->row = 0;
		if (t->col == 180) {
			t->col = 180;
		} else {
			t->col = 70;
		}
		t->active = 1;
	}
}

void drawTesla(TESLA* t) {
	 if(t->active) {
	 	if (t->isTesla) {
	 		drawImage4(t->col, t->row, t->width, t->height, teslaDownBitmap);
		}
 		else
	 		drawRect4(t->col, t->row, t->width, t->height, GRAYID);
	 }
}

void initTeslasOpp() {
	for (int i = 0; i < TESLAOPPCOUNT; i++) {
		if (i % 2 == 0) {
			teslasOpp[i].col = 120;
		} else {
			teslasOpp[i].col = 50;
		}
		teslasOpp[i].row = 160;
		teslasOpp[i].rdel = 2;
		teslasOpp[i].cdel = 2;
		teslasOpp[i].active = 1;
		teslasOpp[i].isTesla = 1;
		teslasOpp[i].height = 28;
		teslasOpp[i].width = 28;
		teslasOpp[i].skipFrames = 0;
	}
}

void updateTeslaOpp(TESLA* t) {
	if (t->active) {

		t->skipFrames++;
		if (!timeCollected) {
			t->row -= t->rdel;
		}
		if (t->skipFrames % 2 == 0) {
			t->row -= t->rdel;
			t->skipFrames = 0;
		}

		if (t->row < 0) {
			if (t->col == 120) {
				t->col = 120;
			} else {
				t->col = 50;
			}
			t->row = 160;
		}

		if (t->active && collision(granny.col, granny.row, granny.width, granny.height, t->col, t->row, t->width, t->height)) {
			t->active = 0;
			hasDec = 1;
		}
	}
	if (!(t->active)) {
		t->row = 160;
		if (t->col == 120) {
			t->col = 120;
		} else {
			t->col = 50;
		}
		t->active = 1;
	}
}

void drawTeslaOpp(TESLA* t) {
	 if(t->active) {
	 	if (t->isTesla) {
	 		drawImage4(t->col, t->row, t->width, t->height, teslaUpBitmap);
		}
 		else
	 		drawRect4(t->col, t->row, t->width, t->height, GRAYID);
	 }
}
