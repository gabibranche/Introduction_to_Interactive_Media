/*

Project Name: Gabi's Cellphone Usage
Author: Gabrielle Branche
Data Source: The data was recorded using the Screen Time Application of Gabi's iPhone
Last Updated: 06 May 2020

*/

//initialize variables


float windSpeed = radians(1);                                          // used to determine the size of the windspeed for scaling

float angle = 0;                                                       // initialize angle of the wind fan
float angleAcceleration = radians(5);                                  // initialize acceleration of the angle

color red=color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);                                         // initialize colors 
color yellow = color(255, 255, 0);
color purple = color(255, 0, 255);

int[] rainbow = {red, green, blue, yellow, purple};                    // populate array with colors



void setup() {
  size(900, 900);
}


void draw() {

  background(0);                                                        // redraws canvas

  push();
    translate(width/3, height/3);                                       // translates the entire windfan
 
   
   // windfan
    push();
      scale(15);                                                        // scales the stick
      stroke(173, 99, 2);                                               // color of the stick
      line(0, 0, 0, 30);                                                // draws the stick of the fan
    pop();
  
  
    push();
      rotate(angle);                                                    // rotates the windfan according to given angle
      scale(15);                                                        // scales the wind fan
      
      for (int i = 0; i<361; i= i+90) {
        rotate(radians(i));
        strokeWeight(0);
        fill(rainbow[i/90]);                                            // draws the wind fan changing the color for each fan
        triangle(0, 0, -10.5, 0, -9, -15);
        triangle(0, 0, -11, 0, -9, 6);
    }
    pop();
  
  
    ellipse(0, 0, 10, 10);                                              // draws the center of the fan
  
  pop();


  // wind
  push();
    translate(mouseX, mouseY);                                          // translates the wind graphic to the position of the cursor
    scale(map(windSpeed, radians(1), radians(90), 1, 3));              // scales the wind graphic according to the windspeed
    stroke(255);
    strokeWeight(3);
    line(0, -10, -50, -10);
    line(0, 0, -50, 0);                                                 //draws the wind graphic
    line(0, 10, -50, 10);
    text("wind", 3, 2);
  pop();



  if (mousePressed == true) {

    increaseWind();                                                     // increase the speed of the wind so that the fan speed increases
    
  } else {
    
    resetWind();                                                        // gradually resets the wind speed to the default wind speed
  }
}
  
  
// functions


void increaseWind() {
  if (angleAcceleration< radians(90)) {

        angleAcceleration = angleAcceleration + radians(1)/5;            // increases the acceleration of the angle
        angle = angle - angleAcceleration/5;                             // changes the angle by which the fan is rotated
        windSpeed = angleAcceleration;                                   // increases the size of the wind graphic
        
    } else {
      
        angle = angle - angleAcceleration/5;                             // sets a max speed for which the angle remains if mouse still pressed
        windSpeed = radians(90);                                         // sets a max size of the wind graphic if mouse still pressed
      
    }
}


void resetWind() {
  windSpeed = radians(1);                                                // wind speed graphic size is reset to the default
        
        if (angleAcceleration> radians(5)) {
          
            angleAcceleration = angleAcceleration - radians(1)/5;        // dereases the acceleration of the angle
            angle = angle - angleAcceleration/5;                         // changes the angle by which the fan is rotated
            
        } else {
          
          angle = angle - angleAcceleration/5;                           // sets a min speed for which the angle 
          
        }
}
