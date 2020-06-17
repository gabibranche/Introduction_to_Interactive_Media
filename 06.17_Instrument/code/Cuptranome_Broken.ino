#include <Servo.h>

#include "pitches.h"


// notes to play, corresponding to the 3 sensors:
int notes[] = {
  NOTE_A4, NOTE_B4, NOTE_C3
};


class playTone
{
    // Class Member Variables
    // These are initialized at startup
    int speakerPin;      // the number of the LED pin
    int buttonNum;


  public:
    playTone(int num)
    {
      speakerPin = 8;
      buttonNum = num;

      pinMode(speakerPin, OUTPUT);

    }

    void Speaker()
    {
      // check to see if it's time to change the state of the LED


      tone(speakerPin, notes[buttonNum], 20);

    }
};

class Sweeper
{
    Servo servo;              // the servo
    int pos = 0;              // current servo position

    int increment;     // increment to move for each interval
    int  updateInterval;      // interval between updates
    unsigned long lastUpdate; // last update of position


  public:
    Sweeper(int interval)
    {
      updateInterval = interval;


    }

    void Attach(int pin)
    {
      servo.attach(pin);
    }

    //    void setTempo(int tempo) {
    //
    //      //      Serial.println(tempo);
    //    }

    void Update()
    {

       int tempoReader = analogRead(A0);
        increment = map(tempoReader, 0, 1023, 1, 5);

      if ((millis() - lastUpdate) > updateInterval) // time to update
      {

       
        lastUpdate = millis();
        

        servo.write(pos);
        pos += increment;// tell servo to go to position in variable 'pos'
        Serial.println(pos);
        // waits 15ms for the servo to reach the position
      }
      if (pos < 0 || pos > 90) { // goes from 0 degrees to 180 degrees
        // in steps of 1 degree
        increment = -increment;
      }
    }



};

//switchButton switchButton1(2, 1);

Sweeper sweeper1(15);

playTone playTone1(1);

void setup()
{
  Serial.begin(2400);
  sweeper1.Attach(9);

}


void loop()
{






  //  sweeper1.setTempo(tempoReader);
  sweeper1.Update();

  int switchState = digitalRead(2);
  if (switchState == HIGH)
  {
    playTone1.Speaker();

  }
}
