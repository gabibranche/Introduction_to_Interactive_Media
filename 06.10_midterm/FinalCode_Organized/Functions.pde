/*------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// functions that control the Welcome Page
/*------------------------------------------------------------------------------------------------------------------------------------------------------------*/
void frontPageTitle() {      
  String title_pt1 = " Welcome to the";
  String title_pt2 = "Ultimate Percy Jackson";                                        // assign text to variables
  String title_pt3 = "Matching Game";
  String levelMessage = "Choose a Level";
  String[] levelNames  = {"EASY", "MEDIUM", "HARD"};



  fill(255);

  title(title_pt1, centerY/2, 32, titleFont);
  title(title_pt2, centerY/2+centerY/4, 64, titleFont);                                // display text using title function
  title(title_pt3, centerY/2+centerY/2, 64, titleFont);
  title(levelMessage, centerY+centerY/4, 24, instructionsFont);


  for (int i = 0; i<3; i++) {

    push();
    translate(width/4*(i+1), centerY+centerY/2);

    levelHover(width/4*(i+1), centerY+centerY/2, 200);                                  // calls the level hover function

    fill(boxFill);

    ellipse(0, 0, 200, 200);                                                            // draws the bubbles displaying levels


    fill(255);
    textAlign(CENTER, CENTER);
    textFont(instructionsFont);
    text(levelNames[i], 0, 0);

    chooseLevel(width/4*(i+1), centerY+centerY/2, 200, i);
    pop();
  }
} 


void title(String s, float y, int i, PFont f) {
  push();
  translate(0, y);
  textAlign(CENTER);                                                                   // function that displays text
  textFont(f, i);
  text(s, centerX, 0);
  pop();
}

void levelHover(float x, float y, float r) {

  if (dist(mouseX, mouseY, x, y) < r/2) {                                              // function that changes color of the bubble being hovered over
    boxFill = color(196, 48, 37);
  } else {
    boxFill = color(41, 166, 166);
  }
}

void chooseLevel(float x, float y, float r, int i) {

  if (dist(mouseX, mouseY, x, y) < r/2) 

    if (i == 0) {
      levelVal = 4;
    } else if (i == 1) {
      levelVal = 8;                                                                     // functioin that assign value to levelVal based on bubbble chosen
    } else if (i == 2) {
      levelVal = 16;
    }
  println(levelVal);
  if (levelSelected == true) {
    refresh();
    println("start Game");
    println(levelVal);
  }
}


void mousePressed() {
  levelSelected = true;                                                                 // mousePressed used to start game
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// functions that the game display
/*------------------------------------------------------------------------------------------------------------------------------------------------------------*/

void chances() {
  push();
  translate(width*1/10, height*0.95);
  textAlign(CENTER);                                                                    // fucntion which displays how many chances are left 
  fill(255);
  textFont(instructionsFont, 18);
  text("Chances Left: " + wrongAnswers, 0, 0);   
  pop();
}

void refreshInfo() {
  fill(41, 166, 166);
  push();
  translate(width*9.2/10, height*0.97);
  rect(0, 0, 100, 40, 30);
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(instructionsFont, 18);                                                        // function which shows how to refresh the game in a bubble
  translate(0, -10);
  text("Press Delete", 0, 0);

  translate(0, 15);
  text("to refresh", 0, 0);
  pop();
  //refresh();
}


/*------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// functions to refesh the game
/*------------------------------------------------------------------------------------------------------------------------------------------------------------*/
void refresh() {

   println("refreshed");
   refreshed = true;
   covered = false;
   lost = false; 
   won = false;                                                                         // function which resets all the values to initial conditions
   wrongAnswers = 4;
   correctSubmitted = false;
   levelSelected = false;
 
}


void keyPressed() {
    if (keyCode == DELETE) {
       refresh();                                                                       // keyPressed used to trigger refresh function that restarts the game
       print(" delete");
    }
  }

/*------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// functions used to set the array of the original locations of the cards
/*------------------------------------------------------------------------------------------------------------------------------------------------------------*/
