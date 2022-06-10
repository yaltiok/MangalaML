import java.util.*;

class Game{
  
  public boolean playerTurn = true;
  Side playerSide, botSide;
  PVector midPoint = new PVector(width/2, height/2);
  PVector playerMidPoint = new PVector(midPoint.x, midPoint.y + 100);
  PVector botMidPoint = new PVector(midPoint.x, midPoint.y - 100);
  Bot bot;

  
  public Game(){
    bot = new Bot();
    ResetSides();
  }
  
  
  public void Show(){
    playerSide.Show();
    botSide.Show();
    textAlign(CENTER, CENTER);
    String s = playerTurn ? "Player" : "Bot";
    text(s, width/2, 50);
    
  }
  
  public void Clicked(PVector mousePos){
    if(playerTurn) playerSide.Clicked(mousePos);
    else {
      int idx = bot.Move(botSide.wells, playerSide.wells, botSide.treasure, playerSide.treasure);
      if(idx >= 0) botSide.Clicked(botSide.wells[idx].pos);
    }
  }
  
  public void GameOver(){
    
    String s = playerSide.GetScore() > botSide.GetScore() ? "PLAYER WON" : playerSide.GetScore() < botSide.GetScore() ? "BOT WON" : "TIE";
    isGameInProgress = false;
    noLoop();
    background(52);
    textAlign(CENTER, CENTER);
    text(s, width/2, 100);
    newGameButton.Show();
    Show();
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
