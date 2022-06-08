class Treasury extends Well{
  
  
  public Treasury(PVector pos, float size){
    super(pos, size);
    count = 0;
  }
  
  
  
  public void Show(){
    
    textAlign(CENTER,CENTER);
    text(count, pos.x, pos.y);
    
    noFill();
    stroke(255);
    ellipse(pos.x, pos.y, size, size * 2);
  }
}
