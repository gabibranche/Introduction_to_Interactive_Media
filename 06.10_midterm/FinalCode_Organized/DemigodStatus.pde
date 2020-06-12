// class used to access the information about each demigod

class DemigodStatus {

  int demigodIndex;                                 // demigod index used to match information with photo from PlayCards                             
  String name, status;                              // initialize data
  JSONArray demigods;                               // json array storing data from JSON file


  //constructor
  DemigodStatus(int i) {

    demigods = loadJSONArray("demigodIndex.json");          // load data from JSON file
    JSONObject demigodData = demigods.getJSONObject(i);     // creates JSON object that takes data from JSON file object with corresponsing index 

    demigodIndex = demigodData.getInt("Demigod Index");     // stores data from JSON file for each object
    name = demigodData.getString("Name");
    status = demigodData.getString("Status");
  }


// method to display information about demigod corresponding with PlayingCard 
  void displayDemigod() {                                   

    textAlign(CENTER);
    
    push();
    fill(255);
    textFont(cardInfoFont);
    translate(width/2, height*9.1/10);
    text("NAME: " + name, 0, 0);
    translate(0, 20);
    text("STATUS: " + status, 0, 0);
    pop();
    
  }
  
}  
