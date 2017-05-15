class Segment{
  int x;
  int y;
  
  public Segment(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void show(){
    stroke(0);
    fill(255);
    rect(x*20,y*20,20,20);
  }
}