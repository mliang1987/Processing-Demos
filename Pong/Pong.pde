boolean[] keys;
Paddle player1;
Paddle player2;
Ball theBall;

void setup(){
  background(200,100,200);
  size(600,400);
  smooth();
  frameRate(60);

  this.keys = new boolean[4];
  keys[0] = false;
  keys[1] = false;  
  keys[2] = false;  
  keys[3] = false; 
  player1 = new Paddle(1);
  player2 = new Paddle(2);
  theBall = new Ball();
}

void draw(){
  background(200,100,200);
  player1.updateSpeed(keys[0],keys[1]);
  player2.updateSpeed(keys[2],keys[3]);
  player1.show();
  player2.show();
  theBall.show();
  boolean gameOn = intersect();
  updateSpeed();
  if(gameOn == false){
    this.setup(); 
  }
}

void updateSpeed(){
  if(theBall.count%4 == 0){
    theBall.multiplier++;
    theBall.count = 1;
  }
}

boolean intersect(){
  if(theBall.y >= 385){
      theBall.y_speed = -1;
          theBall.count++;
    }
    if(theBall.y <= 15){
      theBall.y_speed = 1;
          theBall.count++;
    }
    if(theBall.x>=575){
      if(theBall.y>=player2.y && theBall.y <= (player2.y+60)){
        theBall.x_speed = -1;
    theBall.count++;
      }
      else{
        return false;
      }
    }
    if(theBall.x<=25){
      if(theBall.y>=player1.y && theBall.y <= (player1.y+60)){
        theBall.x_speed = 1;
            theBall.count++;
      }
      else{
        return false;
      }
    }

    return true;
}

void keyPressed(){
  if(key == 'q'){
    keys[0]=true;
  }
  if(key == 'a'){
    keys[1]=true;
  }
  if(key == 'o'){
    keys[2]=true;
  }
  if(key == 'l'){
    keys[3]=true;
  }
}

void keyReleased(){
    if(key == 'q'){
    keys[0]=false;
  }
  if(key == 'a'){
    keys[1]=false;
  }
  if(key == 'o'){
    keys[2]=false;
  }
  if(key == 'l'){
    keys[3]=false;
  }
}