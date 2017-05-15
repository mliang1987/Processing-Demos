class Ball{
  int x;
  int y;
  int x_speed;
  int y_speed;
  
  public Ball(){
    x =  200;
    y = 580;
    x_speed = 2;
    y_speed = -2;
  }
  
  void show(){
    stroke(255);
    fill(255);
    ellipseMode(CENTER);
    ellipse(x,y,20,20);
    x+=x_speed;
    y+=y_speed;
  }

  void changeSpeed(int xs, int ys){
    x_speed = xs;
    y_speed = ys;
  }
  
}