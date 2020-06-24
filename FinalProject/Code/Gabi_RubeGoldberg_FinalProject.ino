/* 
 *  Project: Gabi's Rube Goldberg Machine
 *  Author: Gabrielle Branche
 *  Last Updated: 24 June 2020
 *  
 *  Date Due: 24 June 2020
 *  Instructions: Project runs with physical component and processing
 *  
 *  References: 
 *  Arduino Examples: Tone Melody, SerialCallResponseASCII
 *  Arduino tutorial: Ultrasonic Sensor - https://arduinogetstarted.com/tutorials/arduino-ultrasonic-sensor
 *  
 */

 
#include <Servo.h>                                              // includes the Servo library
#include "pitches.h"                                            // includes the pitches library

// booleans to trigger different parts of the machine
boolean triggerServo, triggerRotary, triggerPulleyStop, triggerServoStop, triggerLED = false;


boolean startRoute = false;                                     //boolean to start the machine
boolean toneComplete = false;                                   // boolean to stop the tone from looping
int routeState = 0;                                             // tells whether the machine is running or not


// class to control LEDs
class LEDs
{
    int ledPin;                                                 // variable for the LED pin

    unsigned long previousMillis = 0;                           // will store last time LED was updated

    long interval;                                              // interval at which to turn on (in milliseconds)


    // constructor method
  public:
    LEDs(int pin, int pauseVal)                                 // takes in pin value and interval value
    {
      ledPin = pin;
      interval = pauseVal;
      pinMode(ledPin, OUTPUT);                                  // sets pinMode for each LED
    }


    void ledON() {

      unsigned long currentMillis = millis();                   // stores the current time in ms

      if (currentMillis - previousMillis >= interval) {         // allows for a delayed reaction without using delay()
        previousMillis = currentMillis;                         // save the last time you blinked the LED
        digitalWrite(ledPin, HIGH);                             // turn on LED
      }
    }
};



// class to control motors
class Motors

{



    // rotary to linear motor
    const int ain1Pin = 13;
    const int ain2Pin = 12;
    const int pwmAPin = 11;
    // declare pin variables
    // pulley motor
    const int bin1Pin = 8;
    const int bin2Pin = 9;
    const int pwmBPin = 5;                                        // because of servo library pin 10 PWM disabled - used pin 5 instead

    int motorSpeed;

    // constructor method
  public:
    Motors(int speedVal)
    {

      motorSpeed = speedVal;                                      // stores value received as the motor speed

      pinMode(ain1Pin, OUTPUT);
      pinMode(ain2Pin, OUTPUT);
      pinMode(pwmAPin, OUTPUT);
      // sets pins for the Motors
      pinMode(bin1Pin, OUTPUT);
      pinMode(bin2Pin, OUTPUT);
      pinMode(pwmBPin, OUTPUT);
    }


    void turnPulley()
    {
      analogWrite(pwmBPin, motorSpeed);
      digitalWrite(bin1Pin, HIGH);                                // turns on the motor functioning as a pseudoPulley for the cup
      digitalWrite(bin2Pin, LOW);
    }

    void turnRotary()
    {
      analogWrite(pwmAPin, motorSpeed);
      digitalWrite(ain1Pin, HIGH);                                // turns on the motor that changes rotary motion to linear motion
      digitalWrite(ain2Pin, LOW);

    }

    void stopPulley()
    {
      digitalWrite(bin1Pin, LOW);                                 // stops the pulley motor
      digitalWrite(bin2Pin, LOW);

    }

    void stopRotary()
    {
      digitalWrite(ain1Pin, LOW);
      digitalWrite(ain2Pin, LOW);                                 // stops the rotary motor
    }

};



// class to control the photoResistor

class PhotoResistor
{
    const int photoResPin = A5;                                   // photoresister pin
    int sensorValue;                                              // stores the value received from analogRead
    int lightThreshold = 860;                                     // the value at which the cup covers the photoResister
                                                                  // LightThreshold changes depending on the light present in the room

    // constructor method
  public:
    PhotoResistor()
    {
      pinMode(photoResPin, INPUT);                                // sets pin for photoResistor
    }

    void readPhotoRes() {
      sensorValue = analogRead(A5);                               // reads the value from the photoresitor
      delay(1);
      Serial.println(sensorValue);                              // used for determining threshold
    }

    void photoResThreshold() {
      if (sensorValue <= lightThreshold) {                        // determines if the cup is covering the sensor using lightThreshold
        triggerPulleyStop = true;                                 // if condition true the pulley is stopped (boolean changes from false to true)
      }
    }
};



// class to control the servo motor
class ServoKick
{
    int servoPin;                                                 // servo pin
    Servo kickServo;                                              // initialises servo
    int pos = 0;                                                  // initial position of servo
    int degree = 10;                                              // degree increments
    unsigned long previousMillis = 0;                             // will store last time LED was updated

    const long interval = 30;                                     // interval to replace delay

    // constructor method
  public:
    ServoKick(int pin)
    {
      servoPin = pin;                                             // takes value inputted and stores it as the servo Pin
    }

    void attachServo() {
      kickServo.attach(servoPin);                                 // method to attach servo in setup
    }


    void kick() {
      unsigned long currentMillis = millis();                     // stores the current time in ms

      if (currentMillis - previousMillis >= interval) {
        previousMillis = currentMillis;                           // save the last time servo moveed

        pos += degree;                                            // increments position with degrees
        kickServo.write(pos);                                     // tell servo to go to position in variable 'pos'
      }

      if ((pos <= 0) || (pos >= 90)) {
        degree = -degree;                                        // if boundaries met, servo changes direction
      }                                                          // this is helpful in the event that the cup does not move or bounces back,
    }                                                            // the servo can launch it repeatedly until it moves far enough



    void defaultPos() {
      kickServo.write(0);                                        // method to return method to default position once the next part of the machine is triggered
      triggerRotary = true;
    }
};


// class to control the switch button
class SwitchButton
{
    const int switchPin = A3;                                     //switch Pin

    // constuctor method
  public:
    SwitchButton() {
      pinMode(switchPin, INPUT);                                  // sets the pin of the switch
    }

    void detectButtonState() {
      int buttonState = digitalRead(switchPin);                   // stores the value received from digitalRead
      delay(1);

      if (buttonState == HIGH) {
        startRoute = true;                                        // starts machine if button pressed
      }
    }

    void buttonOn() {
      routeState = 1;                                             // if button pressed the status of the machin is set to running - '1'
    }

};



// class to control the speaker

class EndTone
{
    int melody[3] = {
      NOTE_C4, NOTE_C4, NOTE_C4                                   // array of notes to play a triple beep to signify end
    };

    int noteDurations[3] = {
      2, 2, 2                                                     // array of lengths for triple beep
    };

    const int speaker = A1;                                       // speaker pin
    unsigned long previousMillis = 0;                             // will store last time method was updated

    const long interval = 12000;                                  // interval before playing tone

    // constuctor method
  public:
    EndTone() {
    }


    void playTone() {
      // iterate over the notes of the melody:
      for (int thisNote = 0; thisNote < 4; thisNote++) {

        // to calculate the note duration, take one second divided by the note type.
        //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.                                // *code taken from toneMelody arduino example
        int noteDuration = 1000 / noteDurations[thisNote];
        tone(A1, melody[thisNote], noteDuration);

        // to distinguish the notes, set a minimum time between them.
        // the note's duration + 30% seems to work well:
        int pauseBetweenNotes = noteDuration * 1.30;
        delay(pauseBetweenNotes);
        // stop the tone playing:
        noTone(A1);
      }
      toneComplete = true;                                                                        // sets boolean to true so that melody isn't repeated
    }


    void startEnd() {
      unsigned long currentMillis = millis();                                                     // stores the millis() value in currentMillis

      if (currentMillis - previousMillis >= interval) {
        previousMillis = currentMillis;                                                           // save the last time method was called
        if (toneComplete == false) {
          playTone();                                                                             // boolean allows for tone to be played only once as it is changes after first round
        }
      }
    }
};



// class to control the ultrasonic sensor
class UltraSound
{

    const int trigPin = 6;                                                                        // ultrasound pins
    const int echoPin = 7;

    float duration_us, distance_cm;                                                               // set variables for calculating distance

    int distanceThreshold = 15.00;                                                                // distance threshold to trigger next part of machine

    unsigned long previousMillis = 0;                                                            // will store last time method was updated

    const long interval = 500;                                                                     // interval before playing tone

  public:

    UltraSound()
    {
      // configure the trigger pin to output mode
      pinMode(trigPin, OUTPUT);
      // configure the echo pin to input mode
      pinMode(echoPin, INPUT);
    }

    void detectDistance() {

      unsigned long currentMillis = millis();                                                     // stores the millis() value in currentMillis

      if (currentMillis - previousMillis >= interval) {
        previousMillis = currentMillis;                                                           // save the last time method was called

        // generate 10-microsecond pulse to TRIG pin
        digitalWrite(trigPin, HIGH);                                                              // code adapted from Arduino tutorial (see references)
        delayMicroseconds(10);
        digitalWrite(trigPin, LOW);

        // measure duration of pulse from ECHO pin
        duration_us = pulseIn(echoPin, HIGH);

        // calculate the distance
        distance_cm = 0.017 * duration_us;

        // print the value to Serial Monitor
        //      Serial.print("distance: ");                                                          // used for debugging
        //      Serial.print(distance_cm);
        //      Serial.print(" cm   -  ");

        //        delay(50);
      }
    }

    void ultraSoundThreshold() {
      if (distance_cm <= distanceThreshold) {                                                        // determines whether the threshold for distance has been met
        triggerServoStop = true;                                                                     // stops servo
      }
      else {
        triggerServoStop = false;
      }
    }

};




//declare class objects

SwitchButton button;

Motors pulleyMotor(200);
Motors rotaryMotor(255);

PhotoResistor photoRes;

ServoKick servoKick(10);

UltraSound ultraSound;

LEDs redLED(4, 3000);
LEDs yellowLED(3, 6000);
LEDs blueLED(2, 9000);

EndTone endTone;



void setup() {
  Serial.begin(9600);                                                               // begin serial port 
  servoKick.attachServo();                                                          // attaches servo
  servoKick.defaultPos();                                                           // sets servo to default position
}



void loop() {

  button.detectButtonState();                                                       // determines if button has been pressed

  if (startRoute == true && routeState == 0) {                                      // if button pressed the machine chain begins 
    button.buttonOn();      
    pulleyMotor.turnPulley();

  }

  photoRes.readPhotoRes();                                                          // photoresister is read and checked to see if threshold reached
  photoRes.photoResThreshold();

  if (triggerPulleyStop == true) {
    pulleyMotor.stopPulley();
    servoKick.kick();                                                               // if light threshold reached the pulley is stopped and the servo begun
  }

  ultraSound.detectDistance();                                                      // ultrasonic sensor values are read and checked to see if threshold reached
  ultraSound.ultraSoundThreshold();

  if (triggerServoStop == true) {                                                   // if distance threshold reached the LEDs and rotary motor are triggered using boolean
    //    servoKick.defaultPos();                                                   
    triggerLED = true;
  }
  
  if (triggerLED == true && triggerServoStop == true) {                             // if condition met rotary motor turned on 
    rotaryMotor.turnRotary();

    redLED.ledON(); 
    yellowLED.ledON();                                                              // LEDs turned on with their respective delays causing a seemingly chain reaction
    blueLED.ledON();
    endTone.startEnd();                                                             // tone played once all three LEDs light
  }


  if (toneComplete == true) {
    routeState = 0;                                                                 // once tone complete, initial conditions go back to default and rotoray motor stopped
    rotaryMotor.stopRotary();                                                       
    startRoute = false;
  }



  Serial.print(startRoute);
  Serial.print(",");                                                                // values sent to processing to be used to display timer
  Serial.println(routeState);
}
void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("0,0,0");   // send an initial string                            // establish contact with processing and send 0's until contact established
    delay(300);
  }
}
