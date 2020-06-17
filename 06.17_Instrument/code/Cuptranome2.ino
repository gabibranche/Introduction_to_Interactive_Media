/*
    Project: Cuptranome
    Author: Gabrielle Branche
    Last Updated: 16 June 2020

    Due Date: 17 June 2020
    Class: Intro to Interactive Media

    References:
      Sweep
      by BARRAGAN <http://barraganstudio.com>
      This example code is in the public domain.
      modified 8 Nov 2013
      by Scott Fitzgerald
      http://www.arduino.cc/en/Tutorial/Sweep

      Multi-tasking the Arduino - Part 1
      https://learn.adafruit.com/multi-tasking-the-arduino-part-1?view=all
*/


#include <Servo.h>    // includes the servo class

Servo myservo;        // create servo object to control a servo

int pos = 0;          // variable to store the servo position
int tempo = 1;        // initializes the value by which the servo angle is incramented


#include "pitches.h"  // includes the pitches library


// notes to play, corresponding to switch buttons:
int notes[] = {
  NOTE_A4, NOTE_C4
};


// class used to play different notes
class playTone
{
    int speakerPin;                            // the number of the speaker pin
    int buttonNum;                             // the index for the notes array - corresponds with the buttons


    // constuctor for the playTone class
  public:
    playTone(int num)
    {
      speakerPin = 8;
      buttonNum = num;
      pinMode(speakerPin, OUTPUT);              // initialize speaker

    }

    void Speaker()
    {
      tone(speakerPin, notes[buttonNum], 20);   // plays the note corresponding to the button
    }
};


// initializes objects in the playTone class
playTone playTone1(0);
playTone playTone2(1);


void setup() {
  myservo.attach(9);          // attaches the servo on pin 9 to the servo object
  Serial.begin(9600);         // used for debugging purposes
}

void loop() {

  int tempoReader = analogRead(A0);                   // reads the values of the potentiometer used to manipulate tempo
  tempo = map(tempoReader, 0, 1023, 1, 5);            // maps the potentiometer values to a scale appropriate for angle of the servo
  Serial.println(tempo);                              // used for debugging purposes

  for (pos = 0; pos <= 90; pos += tempo) {            // goes from 0 degrees to 90 degrees

    playNotes();                                      // calls function used to determine which note to play
    myservo.write(pos);                               // tell servo to go to position in variable 'pos'
    delay(15);                                        // waits 15ms for the servo to reach the position
  }


  for (pos = 90; pos >= 0; pos -= tempo) {            // goes from 90 degrees to 0 degrees
    playNotes();                                      // calls function used to determine which note to play
    myservo.write(pos);                               // tell servo to go to position in variable 'pos'
    delay(15);                                        // waits 15ms for the servo to reach the position
  }
}


// function used to determine which note to play
void playNotes() {
  int switchState1 = digitalRead(2);                            // reads the state of the first switch
  int switchState2 = digitalRead(4);                            // reads the state of the second switch

  if (switchState1 == HIGH && switchState2 == LOW)              // condition for to play tone corresponding to first switch
  {
    playTone1.Speaker();                                        // plays tone
  }
  else if (switchState1 == LOW && switchState2 == HIGH)         // condition for to play tone corresponding to second switch
  {
    playTone2.Speaker();                                        // plays tone
  }
}
