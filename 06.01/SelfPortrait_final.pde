size(900, 900);
background(4, 128, 90);

/*
 //reference grid
  for (int i = 0; i < width; i = i+width/16) {
    for (int j = 0; j < height; j = j+height/16) {
      square(i, j, width/16 );
    }
  }
*/


//Make main body ellipse
    float bodyWidth = width/2;
    float bodyHeight = height*5/8;
    fill(0);
    ellipse(width*3/4, height*3/4, bodyWidth, bodyHeight);


//body features
    stroke(100);
    strokeWeight(1);
  
    //left arm
        line(width*10/16, height*9/16, width*9.5/16, height*13/16);
        line(width*9.5/16, height*13/16, width*11/16, height*14/16);
        
    //right arm
        line(width*14/16, height*10/16, width*13.75/16, height*13/16);
        line(width*13.75/16, height*13/16, width*10/16, height*12.25/16);
        
    //right hand
          stroke(173, 106, 17);
          fill(173, 106, 17);
          ellipse(width*10/16, height*12.75/16, width/40, height/16);
          
    //left hand
          stroke(173, 106, 17);
          fill(173, 106, 17);
          ellipse(width*13.8/16, height*12.5/16, width/30, height/16);
          
          // fingers
            stroke(100);
            strokeWeight(2);
            line(width*13.8/16, height*12.2/16, width*14.0/16, height*12.2/16);
            line(width*13.8/16, height*12.4/16, width*14.0/16, height*12.4/16);
            line(width*13.8/16, height*12.6/16, width*14.0/16, height*12.6/16);
            line(width*13.8/16, height*12.8/16, width*14.0/16, height*12.8/16);
 
 
 //text on sweatshirt
     textSize(50);
     fill(100);
     text("Beijing", width*10.5/16, height*2.9/4); 


 //back hair
     stroke(100);
      strokeWeight(0.5);
      fill(0);
    
      for (int i = width*10/16 ; i < width*11.25/16; i = i+width/126) {
         float hairbraidLength = random((height*5/16), (height*6/16));
         rect(i, height*6/16, width/128, hairbraidLength);  
      }
      
      for (float i = width*12.75/16 ; i < width*14/16; i = i+width/126) {
         float hairbraidLength = random((height*5/16), (height*6/16));
         rect(i, height*6/16, width/128, hairbraidLength);  
      }
 
     
//neck
      fill(173, 106, 17);
      triangle(width*11.5/16, height*7/16, width*11.5/16, height*8.5/16, width*13/16, height*7/16); 


//make main head ellipse
    float headWidth = width/4;
    float headHeight = height*2.5/8;
    fill(173, 106, 17);
    ellipse(width*3/4, height*2.4/8, headWidth, headHeight);


//hairline

    fill(0);
    stroke(0);
    strokeWeight(1);
    arc(width*12/16, height*3.5/16, width*3.75/16, height*2.5/16, PI, 2*PI);
    ellipse(width*13.5/16, height*3.5/16, width/32, height/32);
    
  // right side burn
        arc(width*13.5/16, height*4.6/16, width*1.5/16, height*3.5/16, 0, radians(90));
        arc(width*13.5/16, height*4.6/16, width*1.5/16, height*3.5/16, radians(270), 2*PI);
        ellipse(width*13.5/16, height*3.5/16, width/32, height/32);
  
  //left sideburn
        arc(width*10.5/16, height*4.6/16, width*1.5/16, height*3.5/16, radians(90), radians(270));
        ellipse(width*10.5/16, height*3.5/16, width/32, height/32);

// cover extra sideburns
        fill(173, 106, 17);
        stroke(0);
        strokeWeight(1);
        arc(width*3/4, height*2.4/8, headWidth, headHeight, 0, PI);
  
  
//smile
    fill(120, 21, 14);
    stroke(100);
    strokeWeight(1);
    arc(width*12/16, height*5.75/16, width*1.7/16, height*1.5/16, 0, PI);
  
//teeth

    for (float i = width*11.25/16; i < width *12.5/16; i = i+width/64) {
          stroke(100);
          strokeWeight(1);
          fill(255);
          rect(i, height*5.77/16, width/64, height/55);
        }
        
    for (float i = width*11.5/16; i < width *12.25/16; i = i+width/64) {
          stroke(100);
          strokeWeight(1);
          fill(255);
          rect(i, height*6.1/16, width/64, height/55);
        }
        
    noFill();    
    stroke(120, 21, 14);
    strokeWeight(5);
    arc(width*12/16, height*5.76/16, width*1.65/16, height*1.4/16, 0, PI, CHORD);



//sunglasses

  //frame of the glasses
      strokeWeight(5);
      stroke(148, 139, 21);
      line(width*11.25/16, height*4.5/16, width*12.75/16, height*4.5/16);
    
  //left eye
      strokeWeight(1);
      stroke(100);
      fill(148, 139, 21);
      ellipse(width*11.25/16, height*4.5/16, width/16, height/16);
  
  //left frame
      stroke(100);
      strokeWeight(3);
      line(width*10.45/16, height*4.5/16, width*10.77/16, height*4.4/16);
  
  // right eye
      strokeWeight(1);
      stroke(100);
      fill(148, 139, 21);
      ellipse(width*12.75/16, height*4.5/16, width/16, height/16);

  //right frame
      stroke(100);
      strokeWeight(3);
      line(width*13.45/16, height*4.5/16, width*13.27/16, height*4.4/16);


//nose
      stroke(100);
      strokeWeight(1);
      fill(173, 106, 17);
      ellipse(width*12/16, height*5/16, width*0.7/16, height*0.5/16);
      ellipse(width*12/16, height*4.95/16, width*0.4/16, height*0.7/16);


// hair braids

      stroke(100);
      strokeWeight(0.5);
      fill(0);
      rect(width*11/16, height*3/16, width/128, height*10/16);
      rect(width*13/16, height*3/16, width/128, height*10/16);

//ears

      stroke(173, 106, 17);
      strokeWeight(1);
      fill(173, 106, 17);
  
      //left ear
            ellipse(width*10.5/16, height*4.75/16, width/40, height/30);
        
      //right ear
            ellipse(width*13.5/16, height*4.75/16, width/40, height/30);
    

//cover extra space

      noStroke();
      fill(4, 128, 90);
      rect(0, height*13.5/16, width, height);
      rect(width*15/16, 0, width, height);
