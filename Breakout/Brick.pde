class Brick{
  int R;
  int G;
  int B;
  int alpha;
  int x;
  int y;
  
  boolean dead;
  
  public Brick(int x, int y){
    this.x = x;
    this.y = y;
    R = (int) random(150,255);
    G = (int) random(150,255);
    B = (int) random(150,255);
    dead = false;
    alpha = 255;
  }
  
  void show(){
    noStroke();
    fill(R,G,B, alpha);
    rect(x,y,60,30);
  }
  
  boolean intersect(int xb, int yb){
    if(dead){
      return false; 
    }
    else if(  (xb>=(x-10))&&(xb<=(x+70))&&(yb>=(y-10))&&(yb<=(y+40)) ){
      return true;
    }
    return false;
  }
  
  void kill(){
    dead = true;
    alpha = 0;
  }  
  
}