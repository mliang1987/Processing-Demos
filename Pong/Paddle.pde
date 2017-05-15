class Paddle{
  int player;
  int x;
  int y;
  int speed;
  int playerColor;
  
  Paddle(int player){
    this.player = player;
    x = (player == 1)? 0 : 590;
    playerColor = (player == 1)? 0:255;
    y = 170;
    speed = 0;
  }
  
  void show(){
    stroke(255-playerColor);
    fill(playerColor);
    y = y+speed*4;
    if(y <= 0){
      y = 0;
    }
    if(y >=340){
      y = 340;
    }
    rect(x,y,10,60);
  }
  
  void updateSpeed(boolean up, boolean down){
    if(up==true && down == true){
      speed = 0; 
    }
    else if(up == true){
      speed = -1;
    }
    else if(down == true){
      speed = 1;
    }
    else{
      speed = 0;
    }
  }
  
}