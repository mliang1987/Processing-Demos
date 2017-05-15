Snake theSnake;
Fruit fruit;

void setup(){
  size(600,600);
  frameRate(60); 
  theSnake = new Snake();
  fruit = new Fruit(  (int) random(0,30), (int) random(0,30));
}

void draw(){
  background(0);
  fruit.show();
  update();
  checkDeath();
  theSnake.show();
  delay(100);
}

void update(){
  if(fruit.x==theSnake.snake[0].x && fruit.y==theSnake.snake[0].y){
    theSnake.update(1);
    fruit = new Fruit(  (int) random(0,30), (int) random(0,30));
  }
  else{
    theSnake.update(0);
  }
}

void checkDeath(){
 if(theSnake.snake[0].x<0|| theSnake.snake[0].x>30 || theSnake.snake[0].y<0 ||theSnake.snake[0].y>30 || theSnake.checkDeath()){
   System.out.println("You died!");
   theSnake = new Snake();
 }
}

void keyPressed(){
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