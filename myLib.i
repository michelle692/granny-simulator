# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 26 "myLib.h"
extern unsigned short *videoBuffer;
# 56 "myLib.h"
void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();
# 85 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 96 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 136 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "myLib.c" 2


unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;


void setPixel4(int col, int row, unsigned char colorIndex) {
    unsigned short pixelData = videoBuffer[((row)*(240)+(col)) / 2];
    if (col & 1) {
        pixelData &= 0x00FF;
        pixelData |= (colorIndex << 8);
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[((row)*(240)+(col)) / 2] = pixelData;
}


void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    for (int i = 0; i < height; i++) {
        if ((!(col & 1)) && (!(width & 1))) {

            DMANow(3, &pixelData, &videoBuffer[((row + i)*(240)+(col)) / 2], (2 << 23) | (width / 2));
        } else if ((!(col & 1)) && (width & 1)) {

            if (!(width - 1 <= 0)) {

                DMANow(3, &pixelData, &videoBuffer[((row + i)*(240)+(col)) / 2], (2 << 23) | ((width - 1) / 2));
            }
            setPixel4(col + width - 1, row + i, colorIndex);
        } else if ((col & 1) && (width & 1)) {

            if (!(width - 1 <= 0)) {

                DMANow(3, &pixelData, &videoBuffer[((row + i)*(240)+(col + 1)) / 2], (2 << 23) | ((width - 1) / 2));
            }
            setPixel4(col, row + i, colorIndex);
        } else if ((col & 1) && (!(width & 1))) {

            if (!(width - 2 <= 0)) {

                DMANow(3, &pixelData, &videoBuffer[((row + i)*(240)+(col + 1)) / 2], (2 << 23) | ((width - 2) / 2));
            }
            setPixel4(col + width - 1, row + i, colorIndex);
            setPixel4(col, row + i, colorIndex);
        }
    }
}


void fillScreen4(volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    DMANow(3, &pixelData, videoBuffer, (2 << 23) | (240 * 160) / 2);
}


void drawImage4(int col, int row, int width, int height, const unsigned short *image) {
    for (int i = 0; i < height; i++) {
        DMANow(3, &image[((i)*(width / 2)+(0))], &videoBuffer[((row + i)*(240)+(col)) / 2], width / 2);
    }

}


void drawFullscreenImage4(const unsigned short *image) {
    DMANow(3, image, videoBuffer, 240 * 160 / 2);

}


void waitForVBlank() {
 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}


void flipPage() {
    if ((*(unsigned short *)0x4000000) & (1<<4)) {
        videoBuffer = ((unsigned short *)0x600A000);
    } else {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(unsigned short *)0x4000000) ^= (1<<4);
}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = (1 << 31) | cnt;

}


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA + 10 < rowB + heightB - 1 && rowA + heightA - 1 > rowB + 10
        && colA + 10 < colB + widthB - 1 && colA + widthA - 1 > colB + 10;
}
