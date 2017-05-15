class Ball{
  
  int x;
  int y;
  int y_speed;
  int x_speed;
  int size;
  int count;
  int multiplier;

  
  public Ball(){
    x = 300;
    y = 200;
    size = 30;
    y_speed = 1;
    x_speed = 1;
    multiplier = 2;
    count = 1;
  }

  void show(){
    stroke(0);
    fill(255,255,0);
    ellipseMode(CENTER);
    
    x = x+x_speed*multiplier;
    y = y+y_speed*multiplier;
    
    ellipse(x,y,size,size);
  }

}