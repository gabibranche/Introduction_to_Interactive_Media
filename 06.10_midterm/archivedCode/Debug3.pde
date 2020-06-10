import processing.sound.*;
SoundFile yay;
SoundFile aww;

int maxCards = 16;

int levelVal = 4;

PImage[] pjoImages = new PImage[maxCards];
PlayingCards[] pjoCards = new PlayingCards[maxCards];

float[] cardLocX = new float[maxCards]; 
float[] cardLocY = new float[maxCards] ;

float[] newCardLocX = new float[maxCards]; 
float[] newCardLocY = new float[maxCards] ;

float matchXPosReturned, matchYPosReturned;
int[] photoShuffle;
int[] locShuffle;

boolean covered = true;
boolean correctSubmitted = false;
boolean shuffled = false;
boolean showCard = false;

PFont titleFont, instructionsFont, cardInfoFont;

float centerX;
float centerY;

color boxFill = color(41, 166, 166, 45);


boolean levelSelected = false;

int  matchCard;

float matchCardX, matchCardY;

DemigodStatus[] pjoDemigods = new DemigodStatus[maxCards];

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
    refreshButton();

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
    pjoCards[i] = new PlayingCards(photoShuffle[i], cardLocX[i], cardLocY[i], newCardLocX[i], newCardLocY[i], i);                    // inputs random integers between 0 and list length which will be used to determine order of photos

    pjoDemigods[i] = new DemigodStatus(photoShuffle[i]);
  }//println(cardLocY[i] + "   " + newCardLocY[i]);

  setMatchCard();
  displayCards();
  
  
  covered = false;
  refreshed = false;
}
