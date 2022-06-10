class Bot{

  
  Well[] botWells, playerWells;
  Well botTreasury, playerTreasury;
  
  

  
  public int Move(Well[] botWells, Well[] playerWells, Well botTreasury, Well playerTreasury){
    this.botWells = botWells;
    this.playerWells = playerWells;
    this.botTreasury = botTreasury;
    this.playerTreasury = playerTreasury;
    
    
    
    
    
    // RULE SET
    // If there is a well that ends in the treasury. Play it!
    int a = CheckFreeMove();
    println(a);
    if(a >= 0) {
      println("FREE MOVE");
      return a;
    }
    
    // If there is a chance to make opposition well a multiple of 2 OR there is a chance to land on an empty well. Choose the bigger.
    Integer[] b = CheckEmptyWellMove();
    Integer[] c = CheckDoubleMove();

    
    if(b[0] >= 0 && c[0] >= 0){
      if(b[1] > c[1]){
        print("EMPTY WELL IS BETTER.");
        return b[0];
      }else{
        print("DOUBLE WELL IS BETTER.");
        return c[0];
      }
    }else if(b[0] >= 0){
      print("EMPTY WELL IS ONLY CHOICE. " + b[0]);
      return b[0];
    }else if(c[0] >= 0){
      print("DOUBLE WELL IS CHOICE. " + c[0]);
      return c[0];
    }
    
    // Return random non zero well.
    int threshold = 100;
    int times = 0;
    int count = 0;
    int r = -1;
    while(count == 0 && times <= threshold){
      times++;
      r = int(random(botWells.length));
      count = botWells[r].count;
    }
    return r;
    
  }
  
  
  public Integer[] CheckEmptyWellMove(){
    Integer[] toReturn = new Integer[2];
    int biggest = -100;
    int returnIdx = -1;
    
    for(int i = 0; i < botWells.length; i++){
      if(botWells[i].count == 0) continue;
      Well endingWell = GetEndingWell(i);
      if(Arrays.asList(botWells).contains(endingWell)) {
        if(endingWell.count == 0){
          int endingIdx = FindIndexInWells(endingWell);
          if(endingIdx < 0) continue;
          Well opposite = playerWells[5 - endingIdx];
          if(opposite.count < 1) continue;
          if(opposite.count > biggest){
            biggest = opposite.count;
            returnIdx = i;
          }
        }
      }
    }
    if(returnIdx >= 0){
      toReturn[0] = returnIdx;
      toReturn[1] = biggest;
    }else{
      toReturn[0] = -1;
      toReturn[1] = -1;
    }
    return toReturn;
  }
  
  
  public Integer[] CheckDoubleMove(){
    Integer[] toReturn = new Integer[2];
    int biggest = -100;
    int returnIdx = -1;
    
    for(int i = 0; i < botWells.length; i++){
      if(botWells[i].count == 0) continue;
      Well endingWell = GetEndingWell(i);
      if(Arrays.asList(playerWells).contains(endingWell)) {
        if(endingWell.count % 2 != 0){
          if(endingWell.count + 2 > biggest){ // 2 is there because 1 comes from treasury and 1 comes from making the well double
            biggest = endingWell.count + 2;
            returnIdx = i;
          }
        }
      }
    }
    if(returnIdx >= 0){
      toReturn[0] = returnIdx;
      toReturn[1] = biggest;
    }else{
      toReturn[0] = -1;
      toReturn[1] = -1;
    }
    return toReturn;
  }
  
  
  public int CheckFreeMove(){
    
    for(int i = 0; i < botWells.length; i++){
      Well endingWell = GetEndingWell(i);
      if(endingWell == botTreasury) {
        return i;
      }
    }
    
    return -1;
  }
  
  
  private Well GetEndingWell(int index){
    Well root = botWells[index];
    int c = botWells[index].count;
    for(int i = 0; i < (c > 1 ? c - 1 : c == 1 ? 1 : 0); i++){
      root = root.nextWell;
    }
    return root;
  }
  
  
  private int FindIndexInWells(Well toFind){
    for(int i = 0; i < botWells.length; i++){
      if(botWells[i] == toFind) return i;
    }
    return -1;
  }
  
}
