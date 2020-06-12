/*
Project Name: The Percy Jackson Match Game
 Author: Gabrielle Branche
 Last Updated: 07 June 2020
 
 Due date: 08 June, 2020
 - Images taken from https://riordan.fandom.com
 Art by: Viktoria Ridzel (Viria)
 
 
 */

int maxImages = 8;                                            // initializes the number of photos in the array

int matchCard;                                                // the winning card index for each round
int guessIndex;                                               // index of the card selected by player

int cardX = 0;                                                // manipulated by key press to calculate the index of the card selected
int cardY = 0;

int xPos;                                                     // coordinates for the position of the cards on canvas
int yPos;  

boolean matchCardGuessed = false;                             // boolean to determine if the card guessed matches the winning card                  
boolean answerSubmitted = false;                              // boolean to determine if a card is chosen

int drawImageIndex = 0;                                       // index used to draw cards on the canvas in the order of the randomly generated card order

int[] cardOrder = new int[maxImages];                         // stores random values between 0 and max photos to be used to randomize the PImage array
PImage[] pjoImages = new PImage[maxImages];                   // stores images

final int pause = 3;                                          // variables used to pause game when round completed

void setup() {
  background(100);
  size(800, 800);
  refreshGame();
}


void draw() {

  drawCards();
  cardToMatch();
  guessIndicator();
  determineCard();
}


//function used to navigate through the cards and  and sumbit a chosen card
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      cardY--;
    } else if (keyCode == DOWN) {
      cardY++;
    } else if (keyCode == LEFT) {
      cardX--;
    } else if (keyCode == RIGHT) {
      cardX++;
    } else if (keyCode == SHIFT) {
      answerSubmitted = true;
      println("submitted = true");
    }
  }
}

//function used to determin is card submitted is the correct answer
void determineCard() {
  guessIndex = cardY*4 + cardX;
  if (answerSubmitted == true) {
    if (guessIndex == matchCard) {
      winnerDisplay();
    } else {
      println(guessIndex + ": " + matchCardGuessed);
      background(100);
      matchCardGuessed = false;
      answerSubmitted = false;
    }
  }
}


// function used to draw cards for the Game
void drawCards() {

  //draws cards in grid formation
  for (int y = 0; y < 2; y++ ) {
    for (int x = 0; x < 4; x++ ) {

      yPos = y*height/4;                                    // determines the coordinates of the cards based on the number of cards and the size of the canvas
      xPos = x*height/4;

      imageMode(CENTER);
      rectMode(CENTER);

      push();
        translate(xPos + width/8, yPos + height/8);          // translates grid to become centered horizontally
  
        push();
          scale(3);                                          // scales the cards  
          stroke(0, 0, 0);                                   // refreshes the color of the border around cards if not the selected card    
          rect(0, 0, 30, 50);                                // draws rectangles as if the cards were placed upside down    
        pop();                          

      pop();
    }
  }
}

// displays the card that must be matched at the bottom of the page
void cardToMatch() {

  imageMode(CENTER);
  rectMode(CENTER);

  push();
    translate(width/2, height*3/4);
  
    push();
      scale(5);    
      image(pjoImages[matchCard], 0, 0, 30, 50);            // draws the image corresponding to the matching index
    pop();
  pop();
}


// hightlights the active card. If shift is pressed while at this location this card will be compared to the match
void guessIndicator() {
  push();
    float cardYGuess = cardY*height/4;
    float cardXGuess = cardX*width/4;
  
    translate(cardXGuess + width/8, cardYGuess + height/8);
    scale(3);
  
    stroke(255, 0, 0);
    noFill();
    rect(0, 0, 30, 50);
  pop();
}


//refreshes the cards and gives a new card to be matched
void refreshGame() {
  for (int i = 0; i < pjoImages.length; i ++ ) {
    cardOrder[i] = int(random(0, pjoImages.length+1));                    // inputs random integers between 0 and list length which will be used to determine order of photos
  }

  for (int i = 0; i < pjoImages.length; i ++ ) {
    pjoImages[i] = loadImage( "demigod" + cardOrder[i] + ".jpg" );        // populates the images array using the random card order generated
  }

  matchCard = int(random(cardOrder.length));                              // randomly pics a new card to match
}


//draws the matching over the selected card if player chose correctly
void showWinningCard() {
  push();
    float cardYGuess = cardY*height/4;
    float cardXGuess = cardX*width/4;
  
    translate(cardXGuess + width/8, cardYGuess + height/8);                // translates image to position of card selected
    scale(3);
  
    strokeWeight(3);
    noFill();
    image(pjoImages[guessIndex], 0, 0, 30, 50);                            // draws image that corresponds with card to match
  pop();
}


// displays the image until mouse or key pressed
void winnerDisplay() {
  if (pause<=3) {                               
    showWinningCard();
    textAlign(CENTER);
    textSize(32);
    text("YOU WIN! Press anywhere to restart", width/2, height*9.5/10);
  }
}

// on mouse pressed the refresh game function is called
void mousePressed() {
  refreshGame();
}
