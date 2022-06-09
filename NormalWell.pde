class NormalWell extends Well{
  
  
  

  public NormalWell(PVector pos, float size, Game g){
    super(pos, size, g);
  }
  
  
  public void Show(){
    
    
    if(!highLight) noFill();
    else fill(100, 15, 150, 150);
    stroke(255);
    circle(pos.x, pos.y, size);
    
    
    noStroke();
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(32);
    text(count, pos.x, pos.y);
  }
}
