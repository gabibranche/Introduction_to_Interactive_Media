import processing.sound.*;                                            // imports the processing.sound library

SoundFile yay;                                                        // initialize soundfiles
SoundFile aww;

int maxCards = 16;                                                    // total number of cards in the game

int levelVal = 0;                                                     // initialise the game level difficulty
                                                   


PlayingCards[] pjoCards = new PlayingCards[maxCards];                 // initialize classes
DemigodStatus[] pjoDemigods = new DemigodStatus[maxCards];

float[] cardLocX = new float[maxCards];                               // initialize arrays for original card location 
float[] cardLocY = new float[maxCards] ;

float[] newCardLocX = new float[maxCards];                            // initialize arrays for the shuffled card location
float[] newCardLocY = new float[maxCards] ;  

float matchXPosReturned, matchYPosReturned;                           // * shuffle locations for matchCard                      

int[] photoShuffle;                                                   // array of shuffled photos 
int[] locShuffle;                                                     // array of shuffled locations

boolean levelSelected, correctSubmitted, shuffled = false;            // initialize conditional booleans
boolean covered, refreshed = true;

PFont titleFont, instructionsFont, cardInfoFont;                      // *initialize fonts

float centerX;                                                        // centers the center point of the canvas
float centerY;

color boxFill = color(41, 166, 166, 45);                              // initialize game color palette


int  matchCard;                                                       // intialise matchCard and it's location
float matchCardX, matchCardY;

float rectWidth = 30;                                                 //  initialize size for playing cards
float rectHeight = 50;

String refreshMessage = "Press Delete to Refresh the Game";           // initialize refresh method
