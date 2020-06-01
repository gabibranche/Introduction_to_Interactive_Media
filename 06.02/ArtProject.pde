float r = 0;
float g = 0;
float b = 0;

float Corner1 = 0;
float Corner2 = 0;
float Corner3 = 0;
float Corner4 = 0;

float speedX = random(1, 5);
float speedY = random(1, 5);

float startingPosX = 400;
float startingPosY = 400;

float i = startingPosX;
float j = startingPosY;




void setup() {
  size(900, 900);
  background(0);
}

void draw() {

  // define variables to use to generate colors randomly
  r = random(10, 255);
  g = random(10, 255);
  b = random(10, 255);


  // line stroke and weight.
  stroke(r, g, b);
  strokeWeight(random(1, 20));
  //strokeWeight(4);

  // define boundaries for the rectangles

  Corner1 = random (width/10, width);   //top right
  Corner2 = random(height/10, height);  //bottom right
  Corner3 = random(0, width*9/10);      //bottom left
  Corner4 = random(0, height*9/10);    //top left


  // define speed to randomly change
  speedY = random(1, 5);
  speedX = random(1, 5);


  // functions
  mouseDetect();
  //rotate(radians(10));
  topLine();
  rightLine();
  bottomLine();
  leftLine();

  //create a pasue before making new rectangle
  delay(100);
}



// function to allow for a new art piece to be generated starting wherever the mouse is clicked
void mouseDetect() {
  if (mousePressed == true) {
    background(0);
    startingPosX = mouseX;
    startingPosY = mouseY;
    //println(startingPosX + "    " + startingPosY);
  }
}

//function to draw the top line of the rectangle
void topLine() {

  for (i = startingPosX; i<=Corner1; i = i +speedX) {

    //limits the line to the size of the canvas if boundaries larger/smaller than the canvas size
    if (j>=height || j<=0 || i<=0 || i>=width) {
      println("BREAK");
      break;
    } else {    

      line(i, startingPosY, i+speedX, startingPosY);

      startingPosX = i;

      /* Debugging Code: 
       println(" Corners:   " + Corner1 + "   " + Corner2 + "   " + Corner3 + "    " + Corner4);
       println("Speed:   " + speedX + "   " + speedY);
       println("Index:   " + i+ "    " + j);
       println("Variavle:   " +  startingPosX + "   " + startingPosY);
       */
    }
  }
}  

/* Debugging Code: 
 println("NEW CORNER1");
 println();
 println();
 */

//function to draw the right line of the rectangle
void rightLine() {
  for (j = startingPosY; j<=Corner2; j = j + speedY) {

    if (j>=height || j<=0 || i<=0 || i>=width) {
      println("BREAK");
      break;
    } else {
      line(i, j, i, j+speedY);


      startingPosX = i;
      startingPosY = j;


      /* Debugging Code: 
       println(" Corners:   " + Corner1 + "   " + Corner2 + "   " + Corner3 + "    " + Corner4);
       println("Speed:   " + speedX + "   " + speedY);
       println("Index:   " + i+ "    " + j);
       println("Variavle:   " +  startingPosX + "   " + startingPosY);
       */
    }
  }


  /* Debugging Code: 
   println("NEW CORNER2");
   println();
   println();
   */
}

//function to draw the bottom line of the rectangle
void bottomLine() {

  for (i = startingPosX; i>=Corner3; i = i - speedX) {
    if (j>=height || j<=0 || i<=0 || i>=width) {
      println("BREAK");
      break;
    } else {
      line(i, j, i-speedX, j);

      startingPosX = i;

      /* Debugging Code: 
       println(" Corners:   " + Corner1 + "   " + Corner2 + "   " + Corner3 + "    " + Corner4);
       println("Speed:   " + speedX + "   " + speedY);
       println("Index:   " + i+ "    " + j);
       println("Variavle:   " +  startingPosX + "   " + startingPosY);
       */
    }
  }
}

//function to draw the left line of the rectangle
void leftLine() {

  for (j = startingPosY; j>=Corner4; j = j - speedY) {
    if (j>=height || j<=0 || i<=0 || i>=width) {
      println("BREAK");
      break;
    } else {
      line(i, j, i, j-speedY);


      startingPosX = i;
      startingPosY = j;


      /* Debugging Code: 
       println(" Corners:   " + Corner1 + "   " + Corner2 + "   " + Corner3 + "    " + Corner4);
       println("Speed:   " + speedX + "   " + speedY);
       println("Index:   " + i+ "    " + j);
       println("Variavle:   " +  startingPosX + "   " + startingPosY);
       */
    }
  }
}
