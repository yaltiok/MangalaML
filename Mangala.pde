Button newGameButton;
Game[][] games;
//ublic boolean isGameInProgress = false;
float tick = 7;
float tick2 = 10;
float tickTimer = 0;
float tickTimer2 = 0;
int xCount = 10;
int yCount = 10;
public float xResolution, yResolution;
private boolean running = false;

void setup(){
  size(1200, 1000);
  xResolution = width / xCount;
  yResolution = height / yCount;
  InitGames();
  newGameButton = new NewGameButton(new PVector(width/2, height - 50), 100, 50, "New Game");
}

void InitGames(){
  games = new Game[xCount][yCount];
  for(int j = 0; j < yCount; j++){
    for(int i = 0; i < xCount; i++){
      games[i][j] = new Game(new PVector((xResolution) * i + (xResolution / 2), (yResolution) * j + (yResolution / 2)), i, j);
    } 
  }
}


void draw(){
  background(52);
  newGameButton.Show();
  tickTimer++;
  tickTimer2++;
  
  for(int i = 0; i < yCount; i++){
    for(int j = 0; j < xCount; j++){
      Game g = games[j][i];
      if(!g.isGameInProgress) g.ShowWinner();
      else g.Show();
      //if(tickTimer2 <= tick2) return;
      //tickTimer2 = 0;
      //g.Clicked(new PVector(0,0));
    } 
  }
  
  if(tickTimer2 <= tick2) return;
      tickTimer2 = 0;
  for(int i = 0; i < yCount; i++){
    for(int j = 0; j < xCount; j++){
      Game g = games[j][i];
      if(!g.isGameInProgress) continue;
      g.Clicked(new PVector(0,0));
    } 
  }
}

void mouseMoved(){
  if(tickTimer <= tick) return;
  tickTimer = 0;
  //if(!isGameInProgress) return;
  //g.HoverOver(new PVector(mouseX, mouseY));
}

private void StartGames(){
  for(int i = 0; i < yCount; i++){
    for(int j = 0; j < xCount; j++){
      Game g = games[j][i];
        g.isGameInProgress = true;
     } 
   }
}

void mousePressed(){
  if(newGameButton.IsOverButton(new PVector(mouseX, mouseY))) {
    if(running == false) {
      running = true;
      StartGames();
    }else{
      InitGames();
      StartGames();
    }
  }
}
