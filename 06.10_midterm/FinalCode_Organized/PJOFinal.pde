/*
Project Name: The Percy Jackson Match Game
 Author: Gabrielle Branche
 Last Updated: 12 June 2020
 
 Due date: 10 June, 2020
 - Images taken from https://riordan.fandom.com
 Art by: Viktoria Ridzel (Viria)
 
 Instructions: 
 Match the card displayed with it's corresponding card in the deck after it is displayed and shuffled. 
 Click on a card to submit your choice
 Press delete to restart game
 
 */

void setup() {
  size(900, 900);
  background(0);

  titleFont = createFont("Century Gothic", 64);                        //set fonts for game
  instructionsFont = createFont("Yu Gothic UI Light", 24);
  cardInfoFont = createFont("Franklin Gothic Book", 18);

  centerX = width/2;                                                   // set center point
  centerY = height/2;

  yay = new SoundFile(this, "trumpet.mp3");                            // load song files
  aww = new SoundFile(this, "aww.mp3");

  frontPageTitle();                                                    // function to welcome page
}

void draw() {

  // using multiple conditions allows for manipulation of looping within draw function
  
  
  if (levelSelected == false && lost == false && won == false) {                            // plays front page until conditions changed
    background(0);                                                                                  
    frontPageTitle();
  }

  if (refreshed == true && lost == false && won == false && levelSelected == true) {        // sets up game once conditions met 
    background(0);
    gameSetup();
  }


  if (covered == false && lost == false && won == false && refreshed == false) {             // shows cards for a few seconds before covering them
    coverDeck();
  }

// once cards covered loops between these functions and ignores previous functions until conditions met again 

  if (covered == true && lost == false && won == false && refreshed == false ) {             
    background(0);                                                                               
    
    refreshInfo();                                                                            // displays refresh info                             
    shuffleDeck();                                                                            // moves card from original location to new card location
    
    if (correctSubmitted == true) {                                                           
      pjoCards[matchCard].displayMatchCard();                                                 // if a card us clicked display the card picked until game refreshed
      won = true;
    }

    randomMatchCard();                                                                        // displays the card that needs to be matched
    chances();                                                                                // displays no of chances left  
    youLose();                                                                                // if no chances left jumps to lost page


    if (lost == true && won == false) {                                                       // plays lost page only if conditions met
      lostPage();      
    }

    if (won == true && lost == false) {                                                       // plays won music only is conditions met
      yay.play();
    }
  }
}
