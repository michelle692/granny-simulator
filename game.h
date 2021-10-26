// granny struct
typedef struct {
	int row;
	int col;
	int cdel;
	int height;
	int width;
} PLAYER;


// tesla struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	int isTesla;
	int active;
	int skipFrames;
} TESLA;

// constants
#define TESLACOUNT 6
#define TESLAOPPCOUNT 6


// variables
extern PLAYER granny;
extern TESLA teslas[TESLACOUNT];
extern TESLA teslasOpp[TESLAOPPCOUNT];
extern int grannyLives;
extern int timeCollected;
extern int heartCollected;
extern int flag;

// custom game colors
#define NUMCOLORS 10
enum {BLACKID=(256-NUMCOLORS), BEIGEID, LIGHTBLUEID, DARKBLUEID, TEALID, ORANGEID, GRAY1ID, GRAY2ID, GRAY3ID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

// prototypes
void initGame();
void updateGame();
void drawGame();

void initGranny();
void updateGranny();
void drawGranny();

void initTeslas();
void updateTesla(TESLA *);
void drawTesla(TESLA *);

void initTeslasOpp();
void updateTeslaOpp(TESLA *);
void drawTeslaOpp(TESLA *);

void drawClock(int, int);
void drawHeart(int, int);
