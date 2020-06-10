int wrongAnswers = 4;
boolean lost, won = false;

void determineCard() {
  //for (int i = 0; i < maxCards; i++) {
    //pjoCards[i].containsMatchCard(mouseX, mouseY, i);
  
    if (dist(mouseX, mouseY, matchCardX, matchCardY)<rectHeight) {
      
     //for (int i = 0; i < maxCards; i++) {
       
       //if (i == matchCard) {
      println("Card number " + locShuffle[matchCard] + "  correct");
      println();
      
      correctSubmitted = true;
      
      
    } else {
      //println("wrong Card  " + wrongAnswers);
      //submitted();
      wrongAnswers--;
    }
     }
    
//void showCardPicked() {
//  for (int i = 0; i<levelVal; i++) {
//    pjoCards[photoShuffle[i]].displayCardPicked(mouseX, mouseY);
//  }
//}

void submitted() {
  //if (mouseClicked == true) {
    for(int i= 0; i<levelVal; i++) {
     
    pjoCards[i].displayCardPicked(mouseX, mouseY);
    println(newCardLocX[i]);
    pjoDemigods[i].debugDemigod();
  
  }
    println();
}

void youLose() {
  if (wrongAnswers ==0) {
    //text("you lose!", width/2, height/2);
    println("you lose");
    lost = true;
  }
 
}

//void lostMessage() {
//  int pause = frameCount;
//  if (pause % 200 == 0 ) {
   
//    lost = false;
//  }
//}
  
  void wonMessage() {
  int pause = frameCount;
  if (pause % 200 == 0 ) {
    background(0);
    text("you won", width/2, height/2);
  }
  }
  
  

//}
//void showCard
