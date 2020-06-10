void chances() {
  push();
  translate(width*1/10, height*0.95);
  textAlign(CENTER);
  fill(255);
  textFont(instructionsFont, 18);
  text("Chances Left: " + wrongAnswers, 0, 0);   
  pop();
  
}

void refreshButton() {
   fill(41, 166, 166);
  push();
  translate(width*9.2/10, height*0.97);
  rect(0, 0, 100, 40, 30);
  fill(255);
  textAlign(CENTER, CENTER);
textFont(instructionsFont, 18);
  translate(0, -10);
  text("Press Delete",0,0);
  
  translate(0, 15);
  text("to refresh", 0, 0);
  pop();
  //refresh();
}




boolean refreshed = true;
int keyValue = 0;

void refresh() {

   println("refreshed");
   refreshed = true;
   covered = false;
   lost = false; 
   won = false;
   wrongAnswers = 4;
   correctSubmitted = false;
   levelSelected = false;
 
}


void keyPressed() {
    if (keyCode == DELETE) {
       refresh();
       print(" delete");
    }
  }

    
  
//}
//}
