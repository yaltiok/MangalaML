class Side{
  
  private float wellSize = 100;
  private float offset = 25;
  
  PVector middlePoint;
  
  public NormalWell[] wells;
  Treasury treasure;
  boolean player;
  public Side opposition;
  Game g;
  
  public Side(PVector pos, boolean player, Game g){
    this.middlePoint = pos;
    this.player = player;
    this.g = g;
    Reset();
  }
  
  
  
  public void Reset(){
    wells = new NormalWell[6];
    treasure = new Treasury(player ? new PVector(width - 100, height/2) : new PVector(100, height/2), wellSize);
    
    for(int i = 0; i < wells.length; i++){
      wells[i] = new NormalWell(GetWellPosition(middlePoint, i), wellSize);
    }
  }
  
  
  public void SetNextWells(){
    treasure.nextWell = opposition.wells[opposition.wells.length - 1];
    for(int i = wells.length - 1; i >= 1; i--){
      wells[i].nextWell = wells[i - 1];
    }
    wells[0].nextWell = treasure;
  }
  
  
  public void Show(){
    treasure.Show();
    for(int i = 0; i < wells.length; i++){
      wells[i].Show();
    }
  
  }
  
  public void Clicked(PVector mousePos){
    for(int i = 0; i < wells.length; i++){
      if(wells[i].OverWell(mousePos) && wells[i].count > 0) {
        PlayWell(i);
        wells[i].PlayWell();
        break;
      }
    }
  }
  
  public void PlayWell(int index){
    
    
    g.playerTurn = !g.playerTurn;
  }
  
  
  
  private PVector GetWellPosition(PVector midPoint, int index){
    PVector toReturn = new PVector(0,0);
    
    if(player) toReturn.x = midPoint.x + (2.5 - index) * (wellSize + offset);
    else toReturn.x = midPoint.x + (index - 2.5) * (wellSize + offset);
    toReturn.y = midPoint.y;
    return toReturn;
  }
}
