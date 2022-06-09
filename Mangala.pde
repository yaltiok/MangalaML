Button newGameButton;
Game g;
public boolean isGameInProgress = false;
float tick = 7;
float tickTimer = 0;

void setup(){
  size(1024, 640);
  
  newGameButton = new NewGameButton(new PVector(width/2, height - 50), 100, 50, "New Game");
}


void draw(){
  background(52);
  newGameButton.Show();
  tickTimer++;
  if(!isGameInProgress) return;
  g.Show();
}

void mouseMoved(){
  if(tickTimer <= tick) return;
  tickTimer = 0;
  if(!isGameInProgress) return;
  g.HoverOver(new PVector(mouseX, mouseY));
}

void mousePressed(){
  if(!isGameInProgress && newGameButton.IsOverButton(new PVector(mouseX, mouseY))) {
    g = new Game();
    loop();
    isGameInProgress = true;
  }else if(isGameInProgress){
    g.Clicked(new PVector(mouseX, mouseY));
  }
  
  
}
