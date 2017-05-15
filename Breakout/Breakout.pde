Paddle player;
Ball ball;
Brick[] theBricks;
boolean left;
boolean right;

void setup(){
  background(0);
  size(400,600);
  smooth();
  frameRate(60);
  
  player = new Paddle();
  ball = new Ball();
  theBricks = new Brick[20];
  int i = 15;
  int j = 15;
  int c = 0;
  while(c<20){
    theBricks[c] = new Brick(i,j);
    i+=75;
    if(i>=385){
      i=15;
      j+=40;
    }
    c++;
  }
  left = false;
  right = false;
}


void draw(){
  background(0);
  player.show();
  ball.show();
  for(Brick a:theBricks){
    a.show(); 
  }
  movePaddle();
  ballCollision();
}


void movePaddle(){
  if(left&&right){
    player.changeSpeed(0);
  }
  else if(left){
    player.changeSpeed(-3);
  }
  else if(right){
    player.changeSpeed(3); 
  }
  else{
    player.changeSpeed(0);
  }
}
void ballCollision(){
  if(ball.x>=390){
    ball.changeSpeed(-2,ball.y_speed);
  }
  else if(ball.x<=10){
    ball.changeSpeed(2,ball.y_speed);
  }
  else if(ball.y>=580){
    if(player.intersect(ball.x,ball.y)){
      ball.changeSpeed(ball.x_speed,-2);
    }
    else{
      this.setup();
    }
  }
  else if(ball.y_speed == -2){
    for(Brick a:theBricks){
      if(a.intersect(ball.x,ball.y)){
        a.kill();
        ball.changeSpeed(ball.x_speed,2);
        break;
      }
    }
  }
  else if(ball.y_speed == -2 && ball.y<=10){
    ball.changeSpeed(ball.x_speed,2);
  }
}

void keyPressed(){

    if(key == 'a'){
      left = true;
    }
    if(key == 'd'){
      right = true;
    }
}

void keyReleased(){
   if(key == 'a'){
      left = false;
    }
    if(key == 'd'){
      right = false;
    }
}