void xLocations() {
 int posIndex = 0;
 int xPos;
for (int i = 0; i < maxCards; i++ ) {
   if (posIndex==maxCards/(maxCards/4)) {
          posIndex = 0;
        } 
     
      xPos = posIndex*width/(maxCards/(maxCards/4)) + width/((maxCards/(maxCards/4))*2);
      cardLocX[i] = xPos;
      posIndex++;
}
}

void yLocations() {
   int posIndex = 0;
   int initialPosIndex = 0;
   
 int yPos;

for (int i = 0; i < maxCards; i++ ) {
  
   if (posIndex==maxCards/(maxCards/4)) {
          posIndex = 0;
          initialPosIndex++;
          
        } 
     
      yPos = initialPosIndex*height/(maxCards/2) + height/8;
      cardLocY[i] = yPos;
      posIndex++;
      //println(posIndex);
}
}
