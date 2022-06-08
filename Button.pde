class Button implements IButton{
  PVector pos;
  float w,h;
  
  float right, left, up, down;
  String text;
  
  color hoverColor = color(255);
  
  public Button(PVector pos, float w, float h, String text){
    this.pos = pos;
    this.w = w;
    this.h = h;
    this.text = text;
    
    right = pos.x + w/2;
    left = pos.x - w/2;
    up = pos.y - h/2;
    down = pos.y + h/2;
  }
  
  public void OnClick(){
  
  
  }
  
  public boolean IsOverButton(PVector mousePos){
    float x = mousePos.x;
    float y = mousePos.y;
    return x < right && x > left && y < down && y > up;
  }
  
  public void HoverOver(boolean overButton){
    if(overButton) hoverColor = color(255, 0, 0, 125);
    else hoverColor = color(255);
  }
  
  public void Show(){
    rectMode(CENTER);
    fill(hoverColor);
    rect(pos.x, pos.y, w, h, 15);
    textAlign(CENTER, CENTER);
    textSize(16);
    fill(0);
    text(text, pos.x, pos.y); 
  }
  
}
