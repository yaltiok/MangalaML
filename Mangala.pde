Button newGameButton;
Game g;
boolean isGameInProgress = false;

void setup(){
  size(1024, 640);
  
  newGameButton = new NewGameButton(new PVector(width/2, height - 50), 100, 50, "New Game");
}


void draw(){
  background(52);
  newGameButton.Show();
  if(!isGameInProgress) return;
  g.Show();
}

void mousePressed(){
  if(!isGameInProgress && newGameButton.IsOverButton(new PVector(mouseX, mouseY))) {
    g = new Game();
    isGameInProgress = true;
  }else if(isGameInProgress){
    g.Clicked(new PVector(mouseX, mouseY));
  }
  
  
}
