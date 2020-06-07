void iphoneBackground() {


  textFont(scaleFont, 18);                                                                             // refreshes textFont each time drawn
  background(0);                                                                                       // refreshes background color each time drawn
  
  
  // draws the phone:
  
  fill(255);
  stroke(0);
  strokeWeight(0);                                                                                     //draws the outer layer of the phone
  rectMode(CENTER);                                                                                    
  rect(width/2, height/2, width/2, height*8/10, 30);
  
  
  ellipse(width/2, height*8.6/10, width/15, width/15);                                                 //draws the home button

 
  fill(0, 0, 0, 80);
  rect(width/2, height/2, (width/2)*0.9, (height*8/10)*0.8);                                           // draws the phone screen
  
  
  
  ellipse(width*0.8/2, height*1.5/10, width/60, width/60);
  ellipse(width/2, height*1.2/10, width/120, width/120);                                               // draws the top elements of the phone (camera etc)
  rect(width/2, height*1.5/10, width/15, 5, 30);



  // draws the scale
  stroke(255);
  strokeWeight(3);
  line(width*1.5/10, height*9.5/10, width*8.95/10, height*9.5/10);                                     // draws the x axis of the scale
  
  
  for ( int i=0; i<22; i++) {   
    line(width*1.5/10 + i*dayScale, height*9.3/10, width*1.5/10 + i*dayScale, height*9.5/10);          // draws the scale interval lines
  }

  
  fill(255);
  text("DAY:", width/10, height*9.4/10);                                                               // draws the units of the scale


  for ( int i=0; i<21; i++) {
    fill(255);
    text(i+1, width*1.66/10 + i*dayScale, height*9.4/10);                                              // inserts the day number between intervals
  }



  // title and instruction text
  String instructions = "Hover over different days to see cellphone usage break down over 3 week period";
  String title = "Gabi's Cellphone Usage";
  
  textAlign(CENTER);                                                                                   // centers text to the width of the page
  
  textFont(scaleFont, 24); 
  text(title, width/2, height/20);                                                                     // inserts title
  
  
  textFont(scaleFont, 18); 
  text(instructions, width/2, height/12);                                                              // inserts instructions
}
