class PlayingCards {

  //float rectWidth = 30;
  //float rectHeight = 50;

  float xPos;                                                     // coordinates for the position of the cards on canvas
  float yPos; 

  float newPosX;                                                  // coordinates for the position of cards after shuffled
  float newPosY;

  int cardIndex;                                                  // stores the index of the photo called

  float xSpeed, ySpeed;                                           // initialize speeds for shuffling

  PImage pjoImages;                                               // initialize array of photos used for cards

  color hover = color(175, 230, 4);                               // initialize color palette for hovering



  //constuctor
  PlayingCards(float cards, float x, float y, float newX, float newY) {

    cardIndex = int(cards);                                         // assigns paramter values to local class variables
    xPos = x;
    yPos = y;
    newPosX = newX;
    newPosY = newY;

    pjoImages = loadImage( "demigod" + cardIndex + ".jpg" );        // populates the images array using the random card order generated

    float direction = round(random(0, 1));                          // random direction based on round

    if (direction == 0) {
      xSpeed = (random(5, 7))*1;
      ySpeed = (random(5, 7))*1;
    } else {                                                        // assigns random speed to each object
      xSpeed = (random(5, 7))*-1;
      ySpeed = (random(5, 7))*-1;
    }
  }


  // method to draw cards
  void drawCards() {
    imageMode(CENTER);
    rectMode(CENTER);

    push();
    translate(xPos, yPos);                                   // translates object to its original location
    push();
    scale(2.5);                                              // scales the cards  
    fill(255);
    stroke(0, 0, 0);                                         // refreshes the color of the border around cards if not the selected card    
    image(pjoImages, 0, 0, rectWidth, rectHeight);           // draws images
    pop();                          
    pop();
  }

  // method to returns the new X position of the card chose randomly chosen to be matched
  float matchLocX() {                                         
    matchXPosReturned = newPosX;
    return matchXPosReturned;
  }

  // method to returns the new Y position of the card chose randomly chosen to be matched
  float matchLocY() {                                          
    matchYPosReturned = newPosY;
    return matchYPosReturned;
  }

  // method to display deck for a couple seconds before covering them
  void displayDeck() {
    imageMode(CENTER);
    rectMode(CENTER);

    if (frameCount % 300 == 0 ) {
      coverCards();                        // will only cover cards once the remainder of framecount/300 is 0;
      covered = true;
    }
  }

  // method to cover cards
  void coverCards() {

    hover(mouseX, mouseY);                                      // changes color of card when mouse hovered

    push();
    translate(xPos, yPos);
    push();
    scale(2.5);                                                 // scales the cards  
    fill(hover);
    stroke(0, 0, 0);                                            // refreshes the color of the border around cards if not the selected card    
    rect(0, 0, rectWidth, rectHeight);                          // draws rectangles as if the cards were placed upside down    
    pop();                          
    pop();
  }

  // method to update position of card to new position
  void updateX() {
    xPos += xSpeed;

    if ( abs(xPos - newPosX) < 4) {    
      xSpeed =0;
      yPos += ySpeed;
      if (abs(yPos - newPosY) < 4 ) {
        ySpeed =0;
      }
    }
  }

  // method to change direction of card if boundaries met
  void checkWalls() {
    float x = rectWidth;
    float y = rectHeight;

    if ( (xPos<=x) || (xPos>width-x)) {
      xSpeed = -xSpeed;
    }
    if ( (yPos<y) || (yPos>(600)-y)) {
      ySpeed = -ySpeed;
    }
  }



  // checks if the mouse position is within a card
  boolean contains(float mx, float my) {
    if (dist(mx, my, newPosX, newPosY)<rectWidth) {
      return true;
    } else {
      return false;
    }
  }

// if changes the color of the card when contains is true
  void hover(float mx, float my) {
    if (won == false) {
      if (contains(mx, my)) {
        hover = color(196, 48, 37);
        ;
      } else {
        hover = color(41, 166, 166);
      }
    }
  }

// method to show briefly what card was picked
  void displayCardPicked(float mx, float my ) {
    if (won == false) {
      if (contains(mx, my)) {
        push();
        translate(newPosX, newPosY);
        push();
        scale(2.5);                                                        // scales the cards  
        fill(hover);
        stroke(0, 0, 0);                                                   // refreshes the color of the border around cards if not the selected card    
        image(pjoImages, 0, 0, rectWidth, rectHeight);                                // draws rectangles as if the cards were placed upside down    
        pop();                          
        pop();
      }
    }
  }

// method  called if correct card chosen to show match card and winning message until game refreshed
  void displayMatchCard() {

    push();
    translate(matchCardX, matchCardY);
    push();
    scale(2.5);                                                        // scales the cards  
    fill(hover);
    stroke(0, 0, 0);                                                   // refreshes the color of the border around cards if not the selected card    
    image(pjoImages, 0, 0, rectWidth, rectHeight);                                // draws rectangles as if the cards were placed upside down    
    pop();                          
    pop();


    String wonMessage1= "You have the memory";
    String wonMessage2 = "of Ella the Harpie!";

    push();
    fill(255);
    textFont(instructionsFont, 24);
    translate(width/4, height*2.5/4);
    text(wonMessage1, 0, 0);
    translate(0, 100);
    text(wonMessage2, 0, 0);
    translate(width/2, -50);
    textFont(instructionsFont, 18);
    text(refreshMessage, 0, 0);
    pop();
  }


// method to display the card that needs to be matched
  void CardtoMatch() {
    imageMode(CENTER);
    rectMode(CENTER);

    push();
    translate(width/2, height*3/4);

    push();
    scale(5);    
    image(pjoImages, 0, 0, 30, 50);            // draws the image corresponding to the matching index
    pop();
    pop();
  }

}
