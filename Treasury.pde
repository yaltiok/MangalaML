class Treasury extends Well{
  
  public boolean treasury = true;
  
  public Treasury(PVector pos, float size, Game g){
    super(pos, size, g);
    count = 0;
  }
  
  
  
  public void Show(){
    
    if(!highLight) noFill();
    else fill(100, 15, 150, 150);
    stroke(255);
    ellipse(pos.x, pos.y, size, size * 2);
    
    noStroke();
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(32);
    text(count, pos.x, pos.y);
  }
}
