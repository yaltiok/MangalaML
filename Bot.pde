class Bot{


  
  public int Move(Well[] botWells, Well[] playerWells, Well botTreasury, Well playerTreasury){
    int count = 0;
    int r = -1;
    while(count == 0){
      r = int(random(botWells.length));
      count = botWells[r].count;
    }
    return r;
  }
}
