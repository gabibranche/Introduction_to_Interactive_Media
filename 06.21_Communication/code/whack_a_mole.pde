/*
    Project: Whack-A-Mole: ColorMode
 Author: Gabrielle Branche
 Last Updated: 20 June 2020
 Due Date: 21 June 2020
 Class: Intro to Interactive Media
 
 References:
 WHACK-A-MOLE openProcessing
 https://www.openprocessing.org/sketch/106739
 */

PImage img;                            // initialize mole image
PFont titleFont, scoreFont;            // initialize fonts


int lastTime;
int delayAmount;                       // variables used to control the delat between each mole appearance


color[] hole = {color(224, 0, 7), color(0, 89, 242), color(242, 242, 0)} ;    // list of colors used for the mole holes

int xpos;                              // stores the x position of the mole based on which ever mole is selected
int ypos = -15;                        // stores the y position of the mole based on which ever mole is selected

int randomMole;                        // used to determine which mole is selected
int score = 0;                         // score of how many moles hit and missed
int mole;                              // stores which button is pressed (which mole is hit)

boolean correct, wrong = false;        // conditional variables

SoundFile whack;                       // sound file for when the mole is hit

import processing.sound.*;             // import the Processing sound library
import processing.serial.*;            // import the Processing serial library
Serial myPort;                         // The serial port



void setup() {
  size(900, 900);
  background(0);

  whack = new SoundFile(this, "whack.wav");        // load the sound file

  resetTimer();                                    // calls the reset time for the first time

  img = loadImage("mole.png");                     // loades the mole amage

  randomMole = 1;                                  // initialises the first mole to appear in the first hole

  xpos = width/6;                                  // initialised the xpos for the first appearance

  titleFont = createFont("Ink Free", 48);
  scoreFont = createFont("Consolas", 18);          // initializes fonts


  println(Serial.list());                          // List all the available serial ports


  // calls the port on the computer communication with arduino
  myPort = new Serial(this, Serial.list()[4], 9600);

  // read bytes into a buffer until you get a linefeed (ASCII 10):
  myPort.bufferUntil('\n');

  // draw with smooth edges:
  smooth();
}



void draw() {
  background(0); 


  checkSwitch(randomMole);                                  // checks if the mole selected matches the mole displayed


  textAlign(CENTER);
  fill(255);

  textFont(titleFont);
  text("Whack-a-Mole: ColorMode!", width/2, height/8);
  // draws the title and the score
  fill(255);
  textFont(scoreFont);
  text( "Score: " + score, width/2, height/4);


  push();
  translate(width/6, height/2);
  for (int i = 0; i<3; i++) {


    push();
    translate(i*width/3, height/4);
    scale(2);                                              // draws the holes and the background colors
    fill(hole[i]);
    quad(-25, 0, 25, 0, 50, -100, -50, -100);
    fill(94, 47, 2);
    ellipse(0, 0, 50, 10);
    pop();
  }
  pop();

  if (millis() - lastTime > delayAmount) {

    int randomMoleNew= int (random(1, 4));                 // selects a random hole for the mole to pop up from


    randomMole = randomMoleNew;                            // assigns the new integer to randomMole                 


    if (randomMole == 1) {
      xpos = width/6;
    } else if (randomMole == 2) {
      xpos = width/2;                                      // changes the xpos of the mole based on the random integer chosen
    } else if (randomMole == 3) {
      xpos = width*5/6;
    }
    //}

    if (correct == true) {
      whack.play();                                        // plays whack sound
      score++;                                             // increases score
      mole =0;                                             // resets the mole value to 0 until another button pressed
      correct = false;                                     // resets boolean condition
      ypos = -15;                                          // resets the mole height after it is 'whacked' 
      println("score: " + score);                          // for debugging purposes
    } else if (wrong == true) {
      score--;                                             // decreases score                
      wrong = false;                                       // resets boolean condition
    } 


    resetTimer();                                          // calls reset timer which allows for delay to be repeated
  }


  push();
  rectMode(CENTER);
  imageMode(CENTER);
  translate(xpos, height*3/4);
  scale(2);                                               // draws the mole in the correct hole
  image(img, 0, ypos, 50, 50);
  fill(0);
  rect(0, 30, 50, 50);
  pop();
}

void resetTimer() {
  lastTime = millis();                                    // sets the lastTime to the value of Millis() when the function was last called
  delayAmount = 700;                                      // determines how much time should pass before the mole appears in a new hole
}

void checkSwitch(int i) {
  int correctNum = i;
  if (mole == correctNum) {                               // checks if the integer fed to the function matches the button being pressed 
    correct = true;
    ypos = 25;                                            // changes the y pos of the mole so that it appears 'whacked' into it's hole
  } else if (mole !=0) {
    wrong = true;
    mole = 0;                                             // only considered wrong if a button is actually pressed
  }
}


void serialEvent(Serial myPort) {
  // read the serial buffer:
  String myString = myPort.readStringUntil('\n');
  // if you got any bytes other than the linefeed:
  myString = trim(myString);

  // split the string at the commas and convert the sections into integers:
  int sensors[] = int(split(myString, ','));

  /* print out the values you got:
   for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
   print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");                // used for debugging purposes
   }
   // add a linefeed after all the sensor values are printed:
   println();
   */


  if (sensors.length > 1) {
    for (int i=0; i < sensors.length; i++) {
      if (sensors[i] == 1) {
        mole = i + 1;                                                              // if a switch is pressed the index of that switch is stored in mole
      }
    }
  }
  // send a byte to ask for more data:
  myPort.write("A");  
}
