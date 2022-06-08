class NormalWell extends Well{
  
  
  

  public NormalWell(PVector pos, float size){
    super(pos, size);
  }
  
  
  public void Show(){
    
    textAlign(CENTER,CENTER);
    text(count, pos.x, pos.y);
    noFill();
    stroke(255);
    circle(pos.x, pos.y, size);
  }
}
