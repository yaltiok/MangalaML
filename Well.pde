class Well{
  
  int count = 0;
  public PVector pos;
  public float size;
  public Well nextWell;
  
  
  public Well(PVector pos, float size){
    this.pos = pos;
    this.size = size;
    Reset();
  }
  
  
  public boolean OverWell(PVector mousePos){
    
    float d = dist(pos.x, pos.y, mousePos.x, mousePos.y);
    return d < size/2;
  }
  
  public void PlayWell(){
    if(count <= 0) return;
    nextWell.IncreaseWellCount(count > 1 ? count - 1 : 1);
    if(count > 1) count = 1;
    else count = 0;
  }
  
  public void IncreaseWellCount(int amount){
    if(amount <= 1){
      count++;
    }else{
      count++;
      nextWell.IncreaseWellCount(amount - 1);
    }
  }
  
  
  public void Reset(){
    count = 4;
  }
}
