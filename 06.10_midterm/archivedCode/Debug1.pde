int maxCards = 4;

PImage[] pjoImages = new PImage[maxCards];
PlayingCards[] pjoCards = new PlayingCards[maxCards];

float[] cardLocX = new float[maxCards]; 
float[] cardLocY = new float[maxCards] ;

float[] newCardLocX = new float[maxCards]; 
float[] newCardLocY = new float[maxCards] ;

float matchXPosReturned, matchYPosReturned;
int[] jShuffle;

boolean covered = false;
boolean correctSubmitted = false;
boolean shuffled = false;
boolean showCard = false;

int  matchCard;

float matchCardX, matchCardY;

void setup() {
  size(900, 900);
  background(0);
  smooth();

  matchCard = int(random(maxCards)); 

  xLocations();
  yLocations();

  shuffleArray();

  //println(" JShuffle:  ");
  //printArray(jShuffle);
  //println();

  newLocations();

  for (int i = 0; i < pjoImages.length; i ++ ) {
    pjoCards[i] = new PlayingCards(jShuffle[i], cardLocX[i], cardLocY[i], newCardLocX[i], newCardLocY[i], i);                    // inputs random integers between 0 and list length which will be used to determine order of photos
    //println(cardLocY[i] + "   " + newCardLocY[i]);
  }
  setMatchCard();
  displayCards();
}

void draw() {

  if (covered == false) {
    coverDeck();
  }

  if (covered == true) {
    background(0);
    //println("Game Started");
    //println(shuffled);   


    shuffleDeck();

    if (correctSubmitted == true) {
      pjoCards[matchCard].displayMatchCard();      
    }
    
    
    //submitted();
  }
}

void displayCards() {

  for (int i = 0; i < maxCards; i++) {
    pjoCards[i].drawCards();
  }
}



int[] shuffleArray() {
  int[] index = new int[maxCards];
  for (int i = 0; i<index.length; i++) {
    index[i] = i;
  }
  IntList j;

  j = new IntList();

  for (int i = 0; i<maxCards; i++) {
    j.append(index[i]);
    //println(j);
  }

  j.shuffle();
  jShuffle = j.array();
  return jShuffle;
}

void newLocations() {

  //shuffleArray();
  //println(" new JShuffle:  ");
  //printArray(jShuffle);

  for (int i =0; i<maxCards; i++) {

    newCardLocX[i] = cardLocX[jShuffle[i]];
    newCardLocY[i] = cardLocY[jShuffle[i]];

    //println(cardLocX[i] + "   " + newCardLocX[i]); 

    //println(jShuffle[i]);
  }
}

void coverDeck() {
  for (int i = 0; i < maxCards; i++) {
    pjoCards[i].displayDeck();
  }
}

void shuffleDeck() {
  for (int i = 0; i < maxCards; i++) {
    pjoCards[i].coverCards();
    pjoCards[i].checkWalls();
  }

  for (int i = 0; i < maxCards; i++) {
    pjoCards[i].updateX();
    //pjoCards[i].debug();
  }
}










void mouseClicked() {
  
determineCard();
  //submitted();
}



void setMatchCard() {
  pjoCards[matchCard].matchLocX();
  pjoCards[matchCard].matchLocY();

  matchCardX = matchXPosReturned;
  matchCardY = matchYPosReturned;


  println("card " + matchCard + "    " + matchCardX + "    " + matchCardY);
}
