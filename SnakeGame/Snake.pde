class Snake{
  int tail;
  Segment[] snake = new Segment[100];
  int direction;
  
  public Snake(){
    tail = 1;
    snake[0] = new Segment(15,15);
    snake[1] = new Segment(15,16);
    direction = 0;
  }
  
  void addSegment(int x, int y){
    tail++;
    snake[tail] = new Segment(x,y);
  }
  
  void show(){
    for(Segment a:snake){
      if(a!=null){
        a.show();
      }
    }
  }
  void update(int u){
    int c = tail;
    while(c>=0){
      snake[c+1] = snake[c];
      c--;
    }
    if(u == 0){
      snake[tail+1] = null;
    }
    else{
      tail++;
    }
    if(direction == 0){
      snake[0] = new Segment(snake[1].x,snake[1].y-1 ); 
    }
    else if(direction == 1){
      snake[0] = new Segment(snake[1].x+1,snake[1].y ); 
    } 
    else if(direction == 2){
      snake[0] = new Segment(snake[1].x,snake[1].y+1 ); 
    }    
    else if(direction == 3){
      snake[0] = new Segment(snake[1].x-1,snake[1].y ); 
    }
  }
  
  void changeDirection(int d){
    direction = d; 
  }
  
  boolean checkDeath(){
    for(int i = 1; i<tail; i++){
      if(snake[0].x == snake[i].x && snake[0].y == snake[i].y){
        return true; 
      }
    }
    return false;
    
  }
  
}