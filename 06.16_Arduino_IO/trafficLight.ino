/*
    Project: Traffic Light
    Author: Gabrielle Branche
    Last Updated: 15 June 2020

    Due Date: 16 June 2020
    Class: Intro to Interactive Media
*/

// initialiase pin constants
const int greenPin = 9;
const int yellowPin = 10;
const int redPin = 11;

// initialise variables to control brightness
const int off = 0;
int brightness = 10;

// switchValue globally to be used in multiple functions
int switchValue;


void setup() {

  // declare pins used in this program
  pinMode(redPin, OUTPUT);
  pinMode(yellowPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);

  // initial serial monitor
  Serial.begin(9600);

}

void loop() {


  // assign variables for the input values
  int knobValue = analogRead(A0);
  switchValue = digitalRead(A1);
  int photoResistor = analogRead(A2);


  //  Serial.println(photoResistor);   //used for debugging

  // map input values to be used to proportionally determine the delay between each light signal
  int  redPause = map(knobValue, 0, 1023, 500, 2000);
  int  yellowPause = map(knobValue, 0, 1023, 250, 1000);
  int  greenPause = map(knobValue, 0, 1023, 350, 1400);

  delay(1);        // delay in between reads for stability

  // turn on traffic Light only if below a certain light intensity
  if (photoResistor < 300) {
    redLight(redPause);
    yellowLight(yellowPause);
    greenLight(greenPause);
  }

  //   turn of traffic light if above certain light intensity
  else {
    digitalWrite(redPin, LOW);
    digitalWrite(yellowPin, LOW);
    digitalWrite(greenPin, LOW);

  }

  Serial.println(brightness);
  delay(100);
}

// functions for manipulating each LED

void redLight(int pause) {

  // button pressed increase brightness until 255 else ddecrease brightness until 10
  if ( switchValue == HIGH) {
    brightness = brightness + 20;
    brightness = constrain(brightness, 10, 255);
  } else {
    brightness = brightness - 20;
    brightness = constrain(brightness, 10, 255);
  }

  // turns red LED on at brightness determined by how long button pressed and delays for a time determined by potentiometer
  analogWrite(redPin, brightness);
  analogWrite(yellowPin, off);
  analogWrite(greenPin, off);
  delay(pause);

}



void yellowLight(int pause) {
  
  // button pressed increase brightness until 255 else ddecrease brightness until 10
  if ( switchValue == HIGH) {
    brightness = brightness + 20;
    brightness = constrain(brightness, 10, 255);
  } else {
    brightness = brightness - 20;
    brightness = constrain(brightness, 10, 255);
  }

  // turns yellow LED on at brightness determined by how long button pressed and delays for a time determined by potentiometer
  analogWrite(redPin, off);
  analogWrite(yellowPin, brightness);
  analogWrite(greenPin, off);
  delay(pause);

}



void greenLight( int pause) {
  
  // button pressed increase brightness until 255 else ddecrease brightness until 10
  if ( switchValue == HIGH) {
    brightness = brightness + 20;
    brightness = constrain(brightness, 10, 255);
  } else {
    brightness = brightness - 20;
    brightness = constrain(brightness, 10, 255);
  }

  
  // turns green LED on at brightness determined by how long button pressed and delays for a time determined by potentiometer
  analogWrite(redPin, off);
  analogWrite(yellowPin, off);
  analogWrite(greenPin, brightness);
  delay(pause);

}
