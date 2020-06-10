float rectWidth = 30;
float rectHeight = 50;

float XSPEED = 1;
float YSPEED = 0;

class PlayingCards {



  float xPos;                                                     // coordinates for the position of the cards on canvas
  float yPos; 

  float newPosX;
  float newPosY;

  float intialX;
  float intialY;

  int cardIndex;

  float xSpeed, ySpeed;

  PImage pjoImages; 
  int[] cardOrder = new int[maxCards];  

  color hover;

  //matchCard = int(random(cardOrder.length)); 

  //constuctor
  PlayingCards(float cards, float x, float y, float newX, float newY) {
    cardIndex = int(cards);   
    pjoImages = loadImage( "demigod" + cardIndex + ".jpg" );        // populates the images array using the random card order generated
    xPos = x;
    yPos = y;
    newPosX = newX;
    newPosY = newY;
    xSpeed = random(-5, 5);
    ySpeed = random(-1, 1);
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


  void coverCards() {


    imageMode(CENTER);
    rectMode(CENTER);


    //if (frameCount % 50 == 0) {
    push();
    translate(xPos, yPos);
    push();
    scale(2.5);          // scales the cards  
    fill(255);
    stroke(0, 0, 0);                                   // refreshes the color of the border around cards if not the selected card    
    rect(0, 0, rectWidth, rectHeight);                                // draws rectangles as if the cards were placed upside down    
    //image(pjoImages, 0, 0, rectWidth, rectHeight);

    pop();                          
    pop();
    //}


    //update();
    //checkWalls();
  }

  float newLocX() {
    newXPos = xPos;
    return newXPos;
  }

  float newLocY() {
    newYPos = yPos;
    return newYPos;
  }



  boolean contains(float mx, float my) {
    if (dist(mx, my, newXPos, newYPos)<rectWidth) {
      return true;
    } else {
      return false;
    }
  }

  void hover(float mx, float my) {
    if (contains(mx, my)) {
      hover = color(100, 25, 199);
    } else {
      hover = color(175, 230, 4);
    }
    imageMode(CENTER);
    rectMode(CENTER);



    push();
    translate(xPos, yPos);
    push();
    scale(2.5);          // scales the cards  
    fill(hover);
    stroke(0, 0, 0);                                   // refreshes the color of the border around cards if not the selected card    
    rect(0, 0, rectWidth, rectHeight);                                // draws rectangles as if the cards were placed upside down    
    pop();                          
    pop();
  }

  void update() {
    xPos += xSpeed;

    //println(" xPos = " + xPos + "  newXPos =" + newXPos);

    if ( abs(xPos - newXPos) < 10 ) {
      //println("stopped");
      //println();
      xSpeed =0;
      //yPos += ySpeed;
      //if (yPos == newYPos) {
      //  ySpeed =0;
      //}
    }
  }



  void checkWalls() {
    float x = rectWidth;
    float y = rectHeight;

    if ( (xPos<=x) || (xPos>width-x)) {
      xSpeed = -xSpeed;
    }
    //if ( (yPos<y) || (yPos>(height/2)-y)) {
    //  ySpeed = -ySpeed;
    //}
  }


  //  void moveCards() {
  //    xPos =xPos + xSpeed;
  //  }
  //}
}
