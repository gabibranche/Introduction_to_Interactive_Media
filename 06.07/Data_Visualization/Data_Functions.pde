// tab for all the functions called when notifications() is run



void iphoneDate() {

  textFont(dateFont, 48);                                                        // defines textFont

  JSONObject dataDate = iphoneData.getJSONObject(i);                             // assigns the data found in the first object of the JSON file to the JSONObject

  int day = dataDate.getInt("Day");                                              // assigns data found within the object with prompted label to the variable
  int month = dataDate.getInt("Month");

  String iphoneDay = day + "/" + month;                                          // assign the date to string

  fill(255);
  text(iphoneDay, width/2, height/4);                                            // draws the date at the top of the phone
}






void entertainment() {

  JSONObject entertainment= iphoneData.getJSONObject(i);                          // assigns the data found in the first object of the JSON file to the JSONObject 


  int entHours  = entertainment.getInt("Entertainment Hours");                    // assigns data found within the object with prompted label to the variable 
  int entMinutes  = entertainment.getInt("Entertainment Minutes");


  int entTotal = entHours*60+entMinutes;                                          // converts the total time to minutes


  float y = startHeight;                                                          // calculates starting point for notification bubble          


  float entTotalHeight = map(entTotal, 0, 600, height/50, height/14);             // remaps the total time to be drawn within the notification bubble size

  fill(165, 97, 176);                                                             // fill color for notification bubble
  rect(width*3/10, y, width*4/10, entTotalHeight, 10);                            // draws notification bubble


  fill(255);
  textFont(scaleFont, 14);                                                        // inserts label for notification bubble
  text("ENTERTAINMENT:", width*4/10, y+height/60);
}




void productivity() {

  JSONObject productivity = iphoneData.getJSONObject(i);                           // assigns the data found in the first object of the JSON file to the JSONObject 


  int prodHours  = productivity.getInt("Productivity Hours");                      // assigns data found within the object with prompted label to the variable 
  int prodMinutes  = productivity.getInt("Productivity Minutes");


  int prodTotal = prodHours*60+prodMinutes;                                        // converts the total time to minutes


  float y = startHeight + height/10;                                               // calculates starting point for notification bubble          


  float prodTotalHeight = map(prodTotal, 0, 600, height/50, height/14);            // remaps the total time to be drawn within the notification bubble size

  fill(255, 10, 20);                                                               // fill color for notification bubble
  rect(width*3/10, y, width*4/10, prodTotalHeight, 10);                            // draws notification bubble


  fill(255);
  textFont(scaleFont, 14);                                                         // inserts label for notification bubble
  text("PRODUCTIVITY:", width*4/10, y+height/60);
}




void socialNetwork() {

  JSONObject socialNetwork = iphoneData.getJSONObject(i);                           // assigns the data found in the first object of the JSON file to the JSONObject 


  int socialHours  = socialNetwork.getInt("Social Networking Hours");               // assigns data found within the object with prompted label to the variable 
  int socialMinutes  = socialNetwork.getInt("Social Networking Minutes");


  int socialTotal = socialHours*60+socialMinutes;                                   // converts the total time to minutes


  float y = startHeight + height*2/10;                                              // calculates starting point for notification bubble          


  float socialTotalHeight = map(socialTotal, 0, 600, height/50, height/14);         // remaps the total time to be drawn within the notification bubble size

  fill(209, 167, 0);                                                                // fill color for notification bubble
  rect(width*3/10, y, width*4/10, socialTotalHeight, 10);                           // draws notification bubble


  fill(255);
  textFont(scaleFont, 14);                                                          // inserts label for notification bubble
  text("SOCIAL NETWORKING:", width*4/10, y+height/60);
}





void other() {

  JSONObject other = iphoneData.getJSONObject(i);                                   // assigns the data found in the first object of the JSON file to the JSONObject 


  int otherHours  = other.getInt("Other Hours");                                    // assigns data found within the object with prompted label to the variable 
  int otherMinutes  = other.getInt("Other Minutes");


  int otherTotal = otherHours*60+otherMinutes;                                      // converts the total time to minutes


  float y = startHeight + height*3/10;                                              // calculates starting point for notification bubble          


  float otherTotalHeight = map(otherTotal, 0, 600, height/50, height/14);           // remaps the total time to be drawn within the notification bubble size

  fill(91, 176, 138);                                                               // fill color for notification bubble
  rect(width*3/10, y, width*4/10, otherTotalHeight, 10);                            // draws notification bubble


  fill(255);
  textFont(scaleFont, 14);                                                          // inserts label for notification bubble
  text("OTHER:", width*4/10, y+height/60);
}





void creativity() {

  JSONObject creativity = iphoneData.getJSONObject(i);                           // assigns the data found in the first object of the JSON file to the JSONObject 


  int createHours  = creativity.getInt("Creativity Hours");                      // assigns data found within the object with prompted label to the variable 
  int createMinutes  = creativity.getInt("Creativity Minutes");


  int createTotal = createHours*60+createMinutes;                                // converts the total time to minutes


  float y = startHeight + height*4/10;                                           // calculates starting point for notification bubble          


  float createTotalHeight = map(createTotal, 0, 600, height/50, height/14);      // remaps the total time to be drawn within the notification bubble size

  fill(209, 167, 0);                                                             // fill color for notification bubble
  rect(width*3/10, y, width*4/10, createTotalHeight, 10);                        // draws notification bubble


  fill(255);
  textFont(scaleFont, 14);                                                       // inserts label for notification bubble
  text("CREATIVITY:", width*4/10, y+height/60);
}


void reading() {

  JSONObject reading = iphoneData.getJSONObject(i);                              // assigns the data found in the first object of the JSON file to the JSONObject 


  int readHours  = reading.getInt("Reading &Reference Hours");                   // assigns data found within the object with prompted label to the variable 
  int readMinutes  = reading.getInt("Reading &Reference Hours");


  int readTotal = readHours*60+readMinutes;                                      // converts the total time to minutes


  float y = startHeight + height*5/10;                                           // calculates starting point for notification bubble          


  float readTotalHeight = map(readTotal, 0, 600, height/50, height/14);          // remaps the total time to be drawn within the notification bubble size

  fill(127, 176, 118);                                                           // fill color for notification bubble
  rect(width*3/10, y, width*4/10, readTotalHeight, 10);                          // draws notification bubble


  fill(255);
  textFont(scaleFont, 14);                                                       // inserts label for notification bubble
  text("READING & REFERENCE:", width*4/10, y+height/60);
}
