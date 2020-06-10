void frontPageTitle() {
  String title_pt1 = " Welcome to the";
  String title_pt2 = "Ultimate Percy Jackson";
  String title_pt3 = "Matching Game";
  String levelMessage = "Choose a Level";
  String[] levelNames  = {"EASY", "MEDIUM", "LARGE"};

  
  
fill(255);
  push();
  translate(0, centerY/2);
  textAlign(CENTER);
  textFont(titleFont, 32);
  text(title_pt1, centerX, 0);
  pop();

  push();
  translate(0, centerY/2+centerY/4);
  textAlign(CENTER);
  textFont(titleFont, 64);
  text(title_pt2, centerX, 0);
  pop();

  push();
  translate(0, centerY/2+centerY/2);
  textAlign(CENTER);
  textFont(titleFont, 64);
  text(title_pt3, centerX, 0);
  pop();

  push();
  translate(0, centerY+centerY/4);
  textAlign(CENTER);
  textFont(instructionsFont, 24);
  text(levelMessage, centerX, 0);
  pop();

  for (int i = 0; i<3; i++) {



    push();
    translate(width/4*(i+1), centerY+centerY/2);

    levelHover(width/4*(i+1), centerY+centerY/2, 200);

    fill(boxFill);

    ellipse(0, 0, 200, 200);


    fill(255);
    textAlign(CENTER, CENTER);
    textFont(instructionsFont);
    text(levelNames[i], 0, 0);

    startGame(width/4*(i+1), centerY+centerY/2, 200, i);
    pop();
  }
} 


void levelHover(float x, float y, float r) {


  if (dist(mouseX, mouseY, x, y) < r/2) {
    boxFill = color(196, 48, 37);
  } else {
    boxFill = color(41, 166, 166);
  }
}

void mousePressed() {
  levelSelected = true;
}

void startGame(float x, float y, float r, int i) {
  
    if (dist(mouseX, mouseY, x, y) < r/2) 

      if (i == 0) {
        levelVal = 4; 
      } else if (i == 1) {
        levelVal = 8;
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
