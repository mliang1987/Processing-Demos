import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SnakeGame extends PApplet {

Snake theSnake;
Fruit fruit;

public void setup(){
  
  frameRate(60); 
  theSnake = new Snake();
  fruit = new Fruit(  (int) random(0,30), (int) random(0,30));
}

public void draw(){
  background(0);
  fruit.show();
  update();
  checkDeath();
  theSnake.show();
  delay(100);
}

public void update(){
  if(fruit.x==theSnake.snake[0].x && fruit.y==theSnake.snake[0].y){
    theSnake.update(1);
    fruit = new Fruit(  (int) random(0,30), (int) random(0,30));
  }
  else{
    theSnake.update(0);
  }
}

public void checkDeath(){
 if(theSnake.snake[0].x<0|| theSnake.snake[0].x>30 || theSnake.snake[0].y<0 ||theSnake.snake[0].y>30 || theSnake.checkDeath()){
   System.out.println("You died!");
   theSnake = new Snake();
 }
}

public void keyPressed(){
  if(key == 'a'){
    if(theSnake.direction!=1)
      theSnake.changeDirection(3);
  }
  if(key == 'w'){
    if(theSnake.direction!=2)
       theSnake.changeDirection(0);
  }
  if(key == 'd'){
    if(theSnake.direction!=3)
      theSnake.changeDirection(1);
  }
  if(key == 's'){
    if(theSnake.direction!=0)
      theSnake.changeDirection(2);
  }

}


class Fruit{
  int x;
  int y;
  public Fruit(int x, int y){
   this.x = x;
   this.y = y;
    
  }
  
  public void show(){
    stroke(255);
    fill(255,0,0);
    rect(x*20,y*20,20,20);
  }
}
class Segment{
  int x;
  int y;
  
  public Segment(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  public void show(){
    stroke(0);
    fill(255);
    rect(x*20,y*20,20,20);
  }
}
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
  
  public void addSegment(int x, int y){
    tail++;
    snake[tail] = new Segment(x,y);
  }
  
  public void show(){
    for(Segment a:snake){
      if(a!=null){
        a.show();
      }
    }
  }
  public void update(int u){
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
  
  public void changeDirection(int d){
    direction = d; 
  }
  
  public boolean checkDeath(){
    for(int i = 1; i<tail; i++){
      if(snake[0].x == snake[i].x && snake[0].y == snake[i].y){
        return true; 
      }
    }
    return false;
    
  }
  
}
  public void settings() {  size(600,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "SnakeGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
