class DemigodStatus {

  int demigodIndex;
  String name, status;


  JSONArray demigods;


  //constructor
  DemigodStatus(int i) {

    demigods = loadJSONArray("demigodIndex.json");
    JSONObject demigodData = demigods.getJSONObject(i);

    demigodIndex = demigodData.getInt("Demigod Index");
    name = demigodData.getString("Name");
    status = demigodData.getString("Status");
  }

  void displayDemigod() {
    //println(demigodIndex + ":   " + name);
    //println("      " + status);
    //println();
    textAlign(CENTER);
    
    push();
    fill(255);
    textFont(cardInfoFont);
    translate(width/2, height*9.1/10);
    text("NAME: " + name, 0, 0);
    translate(0, 20);
    text("STATUS: " + status, 0, 0);
    pop();
    
    //println("card " + matchCard + "    " + matchCardX + "    " + matchCardY);
  }
  
  void debugDemigod() {
    println(demigodIndex + ":   " + name);
  }
}
