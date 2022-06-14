import java.util.*;

class Game{
    
  public boolean playerTurn = true;
  public int x,y;
  Side playerSide, botSide;
  PVector midPoint;
  PVector playerMidPoint;
  PVector botMidPoint;
  Bot bot;
  public boolean isGameInProgress = false;
  
  private String s = "";

  
  public Game(PVector pos, int x, int y){
    bot = new Bot();
    this.x = x;
    this.y = y;
    midPoint = pos;
    playerMidPoint = new PVector(midPoint.x, midPoint.y + (yResolution / 2) - (yResolution / 10));
    botMidPoint = new PVector(midPoint.x, midPoint.y - (yResolution / 2) + (yResolution / 10));
    ResetSides();
  }
  
  
  public void Show(){
    playerSide.Show();
    botSide.Show();
    //textAlign(CENTER, CENTER);
    //String s = playerTurn ? "Player" : "Bot";
    //text(s, width/2, 50);
  }
  
  public void ShowWinner(){
    textSize(playerSide.wellSize);
    textAlign(CENTER, CENTER);
    text(s, midPoint.x, midPoint.y);
  }
  
  public void Clicked(PVector mousePos){
    if(playerTurn) {
      //playerSide.Clicked(mousePos);
      int i = bot.Move(playerSide.wells, botSide.wells, playerSide.treasure, botSide.treasure);
      if(i >= 0) playerSide.Clicked(i);
    }
    else {
      int idx = bot.Move(botSide.wells, playerSide.wells, botSide.treasure, playerSide.treasure);
      if(idx >= 0) botSide.Clicked(idx);
    }
  }
  
  public void GameOver(){
    
    s = playerSide.GetScore() > botSide.GetScore() ? "PLAYER WON" : playerSide.GetScore() < botSide.GetScore() ? "BOT WON" : "TIE";
    isGameInProgress = false;
    //noLoop();
    //background(52);
    
    //newGameButton.Show();
    //Show();
  }
  
  public void HoverOver(PVector mPos){
    
    playerSide.ClearHighLights();
    botSide.ClearHighLights();

    playerSide.HoverOver(mPos);
    botSide.HoverOver(mPos);
    
  }
  
  
  public void ResetSides(){
    playerSide = new Side(playerMidPoint, true, this);
    botSide = new Side(botMidPoint, false, this);
    
    playerSide.opposition = botSide;
    botSide.opposition = playerSide;
    
    
    
    playerSide.SetNextWells();
    botSide.SetNextWells();
  }

}
