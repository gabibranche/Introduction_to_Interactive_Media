int firstSensor = 0;    // first analog sensor
int secondSensor = 0;   // second analog sensor
int thirdSensor = 0;    // digital sensor
int inByte = 0;         // incoming serial byte

void setup() {
  // start serial port at 9600 bps and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }


  pinMode(2, INPUT);   // digital sensor is on digital pin 2
  establishContact();  // send a byte to establish contact until receiver responds
}

void loop() {
  // if we get a valid byte, read analog ins:
  if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();

    // reads whether the sensor has been pressed
    // stores either 1 or 0 accordingly
    
    if (digitalRead(2) == HIGH) {
      firstSensor = 1;
    }
    else {
      firstSensor = 0;
    }


    if (digitalRead(4) == HIGH) {                                 
      secondSensor = 1;                                           
    }
    else {
      secondSensor = 0;
    }


    if (digitalRead(7) == HIGH) {
      thirdSensor = 1;
    }
    else {
      thirdSensor = 0;
    }
    
    // send sensor values:
    Serial.print(firstSensor);
    Serial.print(",");
    Serial.print(secondSensor);
    Serial.print(",");
    Serial.println(thirdSensor);
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("0,0,0");   // send an initial string
    delay(300);
  }
}
