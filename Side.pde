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
    treasure = new Treasury(player ? new PVector(width - 100, height/2) : new PVector(100, height/2), wellSize, g);
    
    for(int i = 0; i < wells.length; i++){
      wells[i] = new NormalWell(GetWellPosition(middlePoint, i), wellSize, g);
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
    boolean played = false;
    Well endingWell = new Well(new PVector(0,0), 10, g);
    for(int i = 0; i < wells.length; i++){
      if(wells[i].OverWell(mousePos) && wells[i].count > 0) {
        played = true;
        endingWell = GetEndingWell(i);
        PlayWell(i);
        wells[i].PlayWell();
        break;
      }
    }
    if(!played) return;
    if(Arrays.asList(opposition.wells).contains(endingWell)){
      if(endingWell.count % 2 == 0){
        treasure.count += endingWell.count;
        endingWell.count = 0;
      }
    }
    
    if(Arrays.asList(wells).contains(endingWell)){
      if(endingWell.count == 1){
        int endingIdx = FindIndexInWells(endingWell);
        if(endingIdx < 0) return;
        Well opposite = opposition.wells[5 - endingIdx];
        if(opposite.count < 1) return;
        treasure.count += endingWell.count + opposite.count;
        endingWell.count = 0;
        opposite.count = 0;
      }
    }
    
    
    int total = 0;
    for(int i = 0; i < wells.length; i++){
      total += wells[i].count;
    }
    
    if(total <= 0){
      for(int i = 0; i < wells.length; i++){
        treasure.count += opposition.wells[i].count;
        opposition.wells[i].count = 0;
      }
      
      
      g.GameOver();
      
    }
  }
  
  
  public int GetScore(){
    return treasure.count;
  }
  
  public void HoverOver(PVector mPos){
    Well endingWell = new Well(new PVector(0,0), 10, g);
    for(int i = 0; i < wells.length; i++){
      if(wells[i].OverWell(mPos) && wells[i].count > 0) {
        endingWell = GetEndingWell(i);
        break;
      }
    }
    endingWell.highLight = true;
  }
  
  public void ClearHighLights(){
    treasure.highLight = false;
    for(int i = 0; i < wells.length; i++){
      wells[i].highLight = false;
    }
  }
  
  private int FindIndexInWells(Well toFind){
    for(int i = 0; i < wells.length; i++){
      if(wells[i] == toFind) return i;
    }
    return -1;
  }
  
  public void PlayWell(int index){
    
    Well root = GetEndingWell(index);
    
    if(root != treasure) g.playerTurn = !g.playerTurn;
  }
  
  
  private Well GetEndingWell(int index){
    Well root = wells[index];
    int c = wells[index].count;
    for(int i = 0; i < (c > 1 ? c - 1 : 1); i++){
      root = root.nextWell;
    }
    return root;
  }
  
  
  private PVector GetWellPosition(PVector midPoint, int index){
    PVector toReturn = new PVector(0,0);
    
    if(player) toReturn.x = midPoint.x + (2.5 - index) * (wellSize + offset);
    else toReturn.x = midPoint.x + (index - 2.5) * (wellSize + offset);
    toReturn.y = midPoint.y;
    return toReturn;
  }
}
