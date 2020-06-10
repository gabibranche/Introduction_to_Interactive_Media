/*
Project Name: The Ultimate Percy Jackson Matching Game
 Author: Gabrielle Branche
 Last Updated: 10 June 2020
 
 Due date: 10 June, 2020
 - Images taken from https://riordan.fandom.com
 Art by: Viktoria Ridzel (Viria)
 
 
 */

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
boolean covered = true;

PFont titleFont, instructionsFont, cardInfoFont;                      // *initialize fonts

float centerX;                                                        // centers the center point of the canvas
float centerY;

color boxFill = color(41, 166, 166, 45);                              // initialize game color palette


int  matchCard;                                                       // intialise matchCard and it's location
float matchCardX, matchCardY;

float rectWidth = 30;                                                 //  initialize size for playing cards
float rectHeight = 50;

String refreshMessage = "Press Delete to Refresh the Game";           // initialize refresh methodvoid setup() {
  void setup() {
  size(900, 900);
  background(0);
  titleFont = createFont("Century Gothic", 64);
  instructionsFont = createFont("Yu Gothic UI Light", 24);
  cardInfoFont = createFont("Franklin Gothic Book", 18);

  centerX = width/2;
  centerY = height/2;
  
  yay = new SoundFile(this, "trumpet.mp3");
  aww = new SoundFile(this, "aww.mp3");
  
  //gameSetup();
  
  frontPageTitle();
}

void draw() {
  
  if (levelSelected == false && lost == false && won == false) {
    background(0);
    frontPageTitle();
  }

  if (refreshed == true && lost == false && won == false && levelSelected == true) {
    background(0);
    gameSetup();
  }
  
  
  if (covered == false && lost == false && won == false && refreshed == false) {
    coverDeck();
  }

  if (covered == true && lost == false && won == false && refreshed == false ) {
    background(0);
    //println("Game Started");
    //println(shuffled);   
    refreshInfo();

    shuffleDeck();
    //submitted();

    //cardToMatch();

    if (correctSubmitted == true) {
     
      pjoCards[matchCard].displayMatchCard();
      won = true;
    }

    randomMatchCard();


    chances();
    
    youLose();
  
    
    if (lost == true && won == false) {
     lostPage();
    
    }
    
    if (won == true && lost == false) {
    yay.play();
  }
}

}

void displayCards() {

  for (int i = 0; i < levelVal; i++) {
    pjoCards[i].drawCards();
    //pjoDemigods[i].displayDemigod() ;
  }
  //pjoDemigods[matchCard].displayDemigod() ;
}



int[] shufflePhotos() {
  int[] index = new int[maxCards];
  for (int i = 0; i<index.length; i++) {
    index[i] = i;
  }
  IntList j;

  j = new IntList();

  for (int i = 0; i<index.length; i++) {
    j.append(index[i]);
    //println(j);
  }

  j.shuffle();
  photoShuffle = j.array();
  return photoShuffle;
}

int[] shuffleLoc() {
  int[] index = new int[levelVal];
  for (int i = 0; i<index.length; i++) {
    index[i] = i;
  }
  IntList j;

  j = new IntList();

  for (int i = 0; i<index.length; i++) {
    j.append(index[i]);
    //println(j);
  }

  j.shuffle();
  locShuffle = j.array();
  return locShuffle;
}

void newLocations() {

  //shuffleArray();
  //println(" new JShuffle:  ");
  //printArray(jShuffle);

  for (int i =0; i<levelVal; i++) {

    newCardLocX[i] = cardLocX[locShuffle[i]];
    newCardLocY[i] = cardLocY[locShuffle[i]];

    //println(cardLocX[i] + "   " + newCardLocX[i]); 

    //println(jShuffle[i]);
  }
}

void coverDeck() {
  for (int i = 0; i < levelVal; i++) {
    pjoCards[i].displayDeck();
  }
}

void shuffleDeck() {
  for (int i = 0; i < levelVal; i++) {
    pjoCards[i].coverCards();
    pjoCards[i].checkWalls();
  }

  for (int i = 0; i < levelVal; i++) {
    pjoCards[i].updateX();
    //pjoCards[i].debug();
  }
}










void mouseClicked() {

  determineCard();
  submitted();
}



void setMatchCard() {
  pjoCards[matchCard].matchLocX();
  pjoCards[matchCard].matchLocY();

  matchCardX = matchXPosReturned;
  matchCardY = matchYPosReturned;


  println("card " + matchCard + "    " + matchCardX + "    " + matchCardY);
}

void randomMatchCard() {
  pjoCards[matchCard].CardtoMatch();
  pjoDemigods[matchCard].displayDemigod() ;
  //println("card " + matchCard + "    " + matchCardX + "    " + matchCardY);
}

void gameSetup() {
  background(0);
  smooth();



  xLocations();
  yLocations();

  shufflePhotos();
  shuffleLoc();
  matchCard = int(random(levelVal)); 
  matchCard = locShuffle[matchCard];
  //println(" JShuffle:  ");
  printArray(photoShuffle);
  println();
  printArray(locShuffle);
  println();

  newLocations();

  for (int i = 0; i < levelVal; i ++ ) {
    pjoCards[i] = new PlayingCards(photoShuffle[i], cardLocX[i], cardLocY[i], newCardLocX[i], newCardLocY[i]);                    // inputs random integers between 0 and list length which will be used to determine order of photos

    pjoDemigods[i] = new DemigodStatus(photoShuffle[i]);
  }//println(cardLocY[i] + "   " + newCardLocY[i]);

  setMatchCard();
  displayCards();
  
  
  covered = false;
  refreshed = false;
}

void lostPage() {
   //background(0);
       background(0);
       aww.play();
       push();
       fill(255);
       translate(width/2, height/3);
       textFont(titleFont, 32);
     String lostMessage = "Not even the gods win all their battles!";
    text(lostMessage, 0, 0);
    translate(0, height/3);
    textFont(titleFont, 24);
    text(refreshMessage, 0, 0);
    pop();
    print("lost");
    //lostMessage();
}
