/*

Project Name: Gabi's Cellphone Usage
Author: Gabrielle Branche

Due Date: 07 May 2020
Last Updated: 06 May 2020

User Instructions: Hover over a day on the 'Day Scale' to see the visualization of phone usage for the respective day
Data Source: The data was recorded using the Screen Time Application of Gabi's iPhone
*/

//initialize variables

JSONArray iphoneData;               // used to store the data loaded from the JSON file

PFont dateFont;                     // fonts used 
PFont scaleFont;

float[] scale = new float[100];     // used to store the X values for which each day would be shown
float dayScale;                     // the number of days in the scale


int i;                              // globally initializing index i

float startHeight;                  // point at which the notifications start



//n set up function

void setup() {
  size(900, 900);

  //define pFonts
  scaleFont = createFont("Calibri Light", 18); 
  dateFont = createFont("Calibri Light", 32); 


  startHeight = height/3.5;                          // define the staring point of the first notification
  dayScale = width*2/55;                             // define the scale intervals 

  iphoneData = loadJSONArray("iphoneData.json");     // load data from JSON file


  for (int i = 0; i<22; i++) {
    scale[i] = width*1.5/10 + i*dayScale;            // populate scale asray with interval values
    //println(scale[i]);
  }
}


//draw function
void draw() {

  iphoneBackground();                                // redraws the iphone background population

  for (i = 1; i < iphoneData.size(); i++) {          
    notifications();                                 // completes the notifications function for each object within the JSON file
  }
}





// function to draw the data visualization for each object in the JSON file

void notifications() {

  rectMode(CORNER);                                  // changes the rectMode to corner everytime notification is rerun. This is due to the fact that it is changed to Center whenever iphoneBackground is run


  if (mouseX<=scale[i] && mouseX>=scale[i-1] && mouseY>height*9.3/10 && mouseY<height*9.5/10 ) {

    noFill();
    ellipse(width*1.3/10 + i*dayScale, height*9.3/10, width/30, width/30);  // draws the ellipse that highlights which day's visualization if being shown. Nofill(needed for this purpose)

    noStroke();                                      // removes stroke on the notification bubbles drawn in the following functions without interfereing with the background

    iphoneDate();                                    // displays the date at the top of the iphone  

    entertainment();                                 // displays a notification bubble with the size based on how much time is spent on entertainment

    productivity();                                  // displays a notification bubble with the size based on how much time is spent on productive tasks (as chosen by apple)

    socialNetwork();                                 // displays a notification bubble with the size based on how much time is spent on social networking

    other();                                         // displays a notification bubble with the size based on how much time is spent on other tasks

    creativity();                                    // displays a notification bubble with the size based on how much time is spent on creative tasks (ass chosen by apple)

    reading();                                       // displays a notification bubble with the size based on how much time is spent on reading and referencing
    
  } else {
  }
}
