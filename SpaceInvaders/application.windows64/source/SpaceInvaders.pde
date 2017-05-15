Ship player;
boolean left;
boolean right;
boolean shoot;
Invader[] enemies;
int direction;
int layer;
int score;

void setup() {
  size(600, 600);
  smooth();
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

void draw() {
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

void keyPressed() {
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


void keyReleased() {
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