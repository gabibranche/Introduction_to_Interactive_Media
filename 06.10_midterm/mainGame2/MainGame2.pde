int maxCards = 4;
PImage[] pjoImages = new PImage[maxCards];  
PlayingCards[] pjoCards = new PlayingCards[maxCards];

float[] cardLocX = new float[maxCards]; 
float[] cardLocY = new float[maxCards] ;

float[] newCardLocX = new float[maxCards]; 
float[] newCardLocY = new float[maxCards] ;

float newXPos, newYPos;

void setup() {
  size(900, 900);
  background(0);
  smooth();

  xLocations();
  yLocations();









  for (int i = 0; i < pjoImages.length; i ++ ) {
    pjoCards[i] = new PlayingCards((random(0, pjoImages.length+1)), cardLocX[i], cardLocY[i], newCardLocX[i], newCardLocY[i]);                    // inputs random integers between 0 and list length which will be used to determine order of photos
  }

  displayCards();
  newLocations();

  for (int i = 0; i < pjoImages.length; i ++ ) {
    println(cardLocX[i] + "   " + newCardLocX[i]);
    //println(cardLocY[i] + "   " + newCardLocY[i]);
    println();
  }
}

void draw() {
  background(0);

  shuffleCards();
  //move();
}
//}




void displayCards() {

  for (int i = 0; i < maxCards; i++) {
    pjoCards[i].drawCards();
  }
}

void shuffleCards() {
  for (int i = 0; i < maxCards; i++) {
    pjoCards[i].coverCards();
    //pjoCards[i].moveCards();
    pjoCards[i].update();
    pjoCards[i].checkWalls();
    //pjoCards[i].hover(mouseX, mouseY);

    //pjoCards[i].update();

    //pjoCards[i].checkWalls();
  }
}

void newLocations() {

  int[] index = new int[maxCards];
  for (int i = 0; i<index.length; i++) {
    index[i] = i;
  }
  IntList j;

  j = new IntList();

  for (int i = 0; i<index.length; i++) {
    j.append(index[i]);
  }

  j.shuffle();
  int[] jShuffle = j.array();

  //printArray(jShuffle);

  for (int i =0; i<maxCards; i++) {
    pjoCards[jShuffle[i]].newLocX();
    pjoCards[jShuffle[i]].newLocY();

    newCardLocX[i] = newXPos;
    newCardLocY[i] = newYPos;

    println(jShuffle[i]);
  }
}


void move() {
  for (int i = 0; i < maxCards; i++) {
    //pjoCards[i].moveCards();
  }
}
