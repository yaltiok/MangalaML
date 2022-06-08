import java.util.*;

class Game{
  
  public boolean playerTurn = true;
  Side playerSide, botSide;
  PVector midPoint = new PVector(width/2, height/2);
  PVector playerMidPoint = new PVector(midPoint.x, midPoint.y + 100);
  PVector botMidPoint = new PVector(midPoint.x, midPoint.y - 100);

  
  public Game(){
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
    else botSide.Clicked(mousePos);
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
