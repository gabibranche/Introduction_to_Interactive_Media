float rectWidth = 30;
float rectHeight = 50;

float XSPEED = 1;
float YSPEED = 0;

String refreshMessage = "Press Delete to Refresh the Game";

class PlayingCards {



  float xPos;                                                     // coordinates for the position of the cards on canvas
  float yPos; 

  float newPosX;
  float newPosY;

  float intialX;
  float intialY;

  int cardIndex;

  int index;

  float xSpeed, ySpeed;

  PImage pjoImages; 
  int[] cardOrder = new int[maxCards];  

  color hover = color(175, 230, 4);






  //constuctor
  PlayingCards(float cards, float x, float y, float newX, float newY, int i) {
    cardIndex = int(cards);   
    pjoImages = loadImage( "demigod" + cardIndex + ".jpg" );        // populates the images array using the random card order generated
    xPos = x;
    yPos = y;
    newPosX = newX;
    newPosY = newY;

    index = i;


    float direction = round(random(0, 1));

    if (direction == 0) {
      xSpeed = (random(5, 7))*1;
      ySpeed = (random(5, 7))*1;
    } else {
      xSpeed = (random(5, 7))*-1;
      ySpeed = (random(5, 7))*-1;
    }
  }

  void drawCards() {
    imageMode(CENTER);
    rectMode(CENTER);

    push();
    translate(xPos, yPos);
    push();
    scale(2.5);          // scales the cards  
    fill(255);
    stroke(0, 0, 0);                                   // refreshes the color of the border around cards if not the selected card    
    rect(0, 0, rectWidth, rectHeight);                                // draws rectangles as if the cards were placed upside down    
    image(pjoImages, 0, 0, rectWidth, rectHeight);
    pop();                          
    pop();
  }

  float matchLocX() {
    matchXPosReturned = newPosX;
    return matchXPosReturned;
  }

  float matchLocY() {
    matchYPosReturned = newPosY;
    return matchYPosReturned;
  }

  void displayDeck() {
    imageMode(CENTER);
    rectMode(CENTER);

    int pause = frameCount;
    //println(pause);
    if (pause % 300 == 0 ) {
      coverCards();
      covered = true;
      //refreshed = false;
    }
  }
  void coverCards() {


    hover(mouseX, mouseY);


    push();
    translate(xPos, yPos);
    push();
    scale(2.5);                                                        // scales the cards  
    fill(hover);
    stroke(0, 0, 0);                                                   // refreshes the color of the border around cards if not the selected card    
    rect(0, 0, rectWidth, rectHeight);                                // draws rectangles as if the cards were placed upside down    
    pop();                          
    pop();
  }

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

  void debug () {
    if (index == 1) { 
      println(" xPos = " + xPos + "  newPosX =" + newPosX);
      println(" yPos = " + yPos + "  newPosY =" + newPosY);
      println();
    }
  }


  boolean contains(float mx, float my) {
    if (dist(mx, my, newPosX, newPosY)<rectWidth) {
      return true;
    } else {
      return false;
    }
  }

  void hover(float mx, float my) {
   if(won == false) {
    if (contains(mx, my)) {
      hover = color(196, 48, 37);;
    } else {
      hover = color(41, 166, 166);
    }
  }
  }

  void displayCardPicked(float mx, float my ) {
    //if (showCard ==true) {
      println ("index " + newPosX);
     
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
    text(wonMessage1, 0,0);
    translate(0, 100);
    text(wonMessage2, 0,0);
    translate(width/2, -50);
    textFont(instructionsFont, 18);
    text(refreshMessage, 0, 0);
    pop();
    //print("lost");
    
    
  }
  
  
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


//boolean containsMatchCard(float mx, float my) {
//if (contains(mx, my)) {

//  return true;
//}
}
