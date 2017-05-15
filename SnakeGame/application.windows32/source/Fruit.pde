class Fruit{
  int x;
  int y;
  public Fruit(int x, int y){
   this.x = x;
   this.y = y;
    
  }
  
  void show(){
    stroke(255);
    fill(255,0,0);
    rect(x*20,y*20,20,20);
  }
}