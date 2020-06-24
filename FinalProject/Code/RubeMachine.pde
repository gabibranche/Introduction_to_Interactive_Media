/*
Project: Gabi's Rube Goldberg Machine -Processing Code 
Author: Gabrielle Branche

*See arduino code for more details
*/

import processing.serial.*;                                               // import the Processing serial library
Serial myPort;                                                            // The serial port


int startRoute, routeState;                  

boolean showTimer, firstTime= true;                                       // boolean to start timer only when contact established

float sec = 0;  
int milsec = 0;                                                           // initialise variables to display timer


float stopwatch;                                                          // initialise variables to determine start of timer only after contact established and button pressed
int startTimer = 0; 


String timer = " 0 000";                                                  // string of timer used to display as text on screen

PFont timerFont, titleFont;                                               // initialise fonts

color fontColor = 255;                                                    // initialise font color


void setup() {
  //size(900, 900);                                                       // used for debugging
  fullScreen();                                                           // used for actual display

  timerFont = createFont("consolas", 70);                                 // create fonts
  titleFont = createFont("ink free", 70);



  println(Serial.list());                                                 // prints all ports 


  myPort = new Serial(this, Serial.list()[4], 9600);                      // selects port used to establish contact with arduino


  myPort.bufferUntil('\n');                                               // read bytes into a buffer until you get a linefeed (ASCII 10)

  smooth();                                                               // draw with smooth edges:
}


void draw() {
  background(0);                                                          // background

  textFont(titleFont, 80);                                               
  textAlign (CENTER, CENTER);                                             // draw title
  text("Gabi's Electronic Rube Goldberg Machine", width/2, height/4);


  displayTimer();                                                         // calls function that displays timer

  if (startRoute == 1 && routeState == 1 && firstTime == true) {
    startTimer = millis();                                                // stores millis() into Starttimer once button pressed
    showTimer = true;                                                     // begins updating timer
    firstTime = false;                                                    // used to prevent startTimer from updating
    fontColor = 255;                                                      // changes the font color to white
  } else if ( startRoute == 0 && routeState == 0) {
    showTimer = false;                                                    // stops updating timer
    fontColor = color(255, 38, 82);                                       // display's timer as pink
  }
}


// serialEvent method is run automatically by the Processing applet whenever
// the buffer reaches the  byte value set in the bufferUntil()
// method in the setup():

void serialEvent(Serial myPort) {
  // read the serial buffer:
  String myString = myPort.readStringUntil('\n');
  // if you got any bytes other than the linefeed:
  myString = trim(myString);
  // code adapted from Arduino example Serial Call and Response in ASCII
  // split the string at the commas and convert the sections into integers:
  int sensors[] = int(split(myString, ','));

  // print out the values you got:
  for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
    print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
  }
  // add a linefeed after all the sensor values are printed:
  println();
  if (sensors.length > 1) {
    startRoute = sensors[0];
    routeState = sensors[1];
  }
  // send a byte to ask for more data:
  myPort.write("A");
}


// function to update and draw timer
void displayTimer() {
  if (showTimer == true) {
    stopwatch = millis() - startTimer;                          // stopwatch starts once contact establised
    sec = int(stopwatch/1000);                                  // separates seconds from millis()
    milsec = int(stopwatch % 1000);                             // stores the remainder in milsec to separate ms from s
    String secVal = nf(sec, 1, 0);                              // removes decimal point from sec
    timer = secVal + "  " +  milsec;                            // stores value as a string to use in text()
  }



  push();
  textFont(timerFont);
  textAlign(CENTER, CENTER);
  translate(width/2, height/2);
  scale(3);                                                      // draws to the timer on the screen
  fill(fontColor);
  text(timer, 0, 0);
  pop();
}
