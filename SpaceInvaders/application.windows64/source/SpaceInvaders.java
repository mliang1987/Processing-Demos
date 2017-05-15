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

public class SpaceInvaders extends PApplet {

Ship player;
boolean left;
boolean right;
boolean shoot;
Invader[] enemies;
int direction;
int layer;
int score;

public void setup() {
  
  
  frameRate(30);
  direction = 1;
  player = new Ship(280, 580);
  enemies = new Invader[20];
  int count = 0;
  int row = 1;
  layer = 2;
  while (row<5) {
    enemies[count] = new Invader( (count%5+1)*60, row*40);
    count++; 
    if (count %5==0) {
      row++;
    }
  }
  score = 0;
}

public void draw() {
  background(0);
  player.moveOrShoot (left, right, shoot);
  player.show();
  if ((direction == 1 && enemies[0].x>=300)||(direction == 3 && enemies[0].x<=10)) {
    for (Invader a : enemies) {
      a.changeSpeed(0, 1);
    }
    direction = 2;
  } else if (direction == 2&& enemies[0].y >= layer*40) {
    layer++;
    if (enemies[0].x>=300 ) {
      for (Invader a : enemies) {
        a.changeSpeed(-1, 0);
      }
      direction = 3;
    } else {
      for (Invader a : enemies) {
        a.changeSpeed(1, 0);
      }
      direction = 1;
    }
  }
  for (Invader a : enemies) {
    if(a.alive==true&&player.shot!=null && player.shot.x>=a.x&&player.shot.x<=(a.x+40)&&player.shot.y>=a.y&&player.shot.y<=(a.y+10)){
      a.alive = false;
      score++;
      player.shot = null;
    }
    a.show();
  }
  if(layer == 7){
    System.out.println("You lose!");
    this.setup(); 
  }
  if(score == 20){
    System.out.println("You win!");
    this.setup();
  }
}

public void keyPressed() {
  if (key=='a') {
    left = true;
  }
  if (key=='d') {
    right = true;
  }
  if (key=='s') {
    shoot = true;
  }
}


public void keyReleased() {
  if (key=='a') {
    left = false;
  }
  if (key=='d') {
    right = false;
  }
  if (key=='s') {
    shoot = false;
  }
}
class Bullet {
  int x;
  int y;
  int speed;

  public Bullet(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 10;
  }

  public void show() {
    noStroke();
    fill(255, 255, 0);
    rect(x, y, 5, 10);
    y = y-speed;
  }
}
class Invader {
  int x;
  int y;
  int R;
  int G;
  int B;
  int x_speed;
  int y_speed;
  int direction;
  boolean alive;

  public Invader(int x, int y) {
    this.x = x;
    this.y = y;
    R = (int) random(0, 200);
    G = (int) random(0, 200);
    B = (int) random(0, 200);
    x_speed = 1;
    y_speed = 0;
    direction = 1;
    alive = true;
  }

  public void show() {
    if (alive) {
      stroke(255);
      fill(R, G, B, 255);
    } else {
      noStroke();
      fill(R, G, B, 0);
    }
    rect(x, y, 40, 10);

    x+=x_speed;
    y+=y_speed;
  }

  public void changeSpeed(int xs, int ys) {
    x_speed = xs;
    y_speed = ys;
  }
}
class Ship {
  int x;
  int y;
  int wide;
  int tall;
  int speed;
  Bullet shot;

  public Ship(int x, int y) {
    this.x = x;
    this.y = y;
    wide = 40;
    tall = 25;
    speed = 0;
    shot = null;
  }
  public void show() {
    stroke(255);
    fill(0, 0, 255);
    triangle(x, y, x+wide, y, x+wide/2, y-tall);
    x=x+speed;
    if (shot != null) {
      if (shot.y<=0) {
        shot = null;
      } else {
        shot.show();
      }
    }
  }

  public void moveOrShoot(boolean left, boolean right, boolean shoot) {
    if (shoot == true && shot == null) {
      shot = new Bullet(x+wide/2, y-tall-20);
    }
    if (left == true && right == true) {
      speed = 0;
    } else if (left == true) {
      if (x<=2) {
        speed = 0;
      } else {
        speed = -5;
      }
    } else if (right == true) {
      if (x>=558) {
        speed = 0;
      } else {
        speed = 5;
      }
    } else {
      speed = 0;
    }
  }
}
  public void settings() {  size(600, 600);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "SpaceInvaders" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
