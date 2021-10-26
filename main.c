#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"
#include "titleScreen.h"
#include "winScreenR.h"
#include "loseScreenR.h"
#include "pauseScreen.h"
#include "dentures.h"


// prototypes
void initialize();

// state prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// states
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// buttons
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

// text buffer
char buffer[41];


int main() {
    initialize();

    while(1) {

        oldButtons = buttons;
        buttons = BUTTONS;

        switch(state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }

    }
}

// set up gba
void initialize() {
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    goToStart();
}

void goToStart() {

    DMANow(3, titleScreenPal, PALETTE, 256);
    drawFullscreenImage4(titleScreenBitmap);
    waitForVBlank();
    flipPage();

    state = START;
    seed = 0;
}

void start() {
    seed++;
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        initGame();
        goToGame();
    }
}

void goToGame() {
    state = GAME;
}

void game() {
    // update score
    updateGame();
    drawGame();

    sprintf(buffer, "lives: %d", grannyLives);
    drawString4(5, 3, buffer, GRAY1ID);

    DMANow(3, denturesPal, PALETTE, denturesPalLen / 2);
    drawImage4(0, 70, 28, 28, denturesBitmap);
 
    waitForVBlank();
    flipPage();

    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();
    if (grannyLives == 0)
        goToLose();
    if (collision(granny.col, granny.row, granny.width, granny.height, 0, 70, 28, 28))
        goToWin();
}

void goToPause() {
    DMANow(3, pauseScreenPal, PALETTE, 256);
    drawFullscreenImage4(pauseScreenBitmap);
    waitForVBlank();
    flipPage();
    state = PAUSE;
}

void pause() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

void goToWin() {
    DMANow(3, winScreenRPal, PALETTE, 256);
    drawFullscreenImage4(winScreenRBitmap);
    waitForVBlank();
    flipPage();

    state = WIN;
}

void win() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

void goToLose() {

    DMANow(3, loseScreenRPal, PALETTE, 256);
    drawFullscreenImage4(loseScreenRBitmap);
    waitForVBlank();
    flipPage();

    state = LOSE;
}

void lose() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}