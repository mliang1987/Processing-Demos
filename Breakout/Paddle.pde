class Paddle{
  
  int x;
  int speed;
  
  public Paddle(){
    x = 170;
    speed = 3;
  }
  
  void show(){
     stroke(0);
     fill(255);
     rect(x,590,60,10);
     x+=speed;
  }
  
  boolean intersect(int xb, int yb){
    if(xb>=x-10 && xb<=x+70){
      return true;
    }
    return false;
  }
  
  void changeSpeed(int s){
    this.speed = s; 
  }
}