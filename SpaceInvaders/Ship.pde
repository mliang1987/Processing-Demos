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
  void show() {
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

  void moveOrShoot(boolean left, boolean right, boolean shoot) {
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