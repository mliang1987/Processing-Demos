class Bullet {
  int x;
  int y;
  int speed;

  public Bullet(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 10;
  }

  void show() {
    noStroke();
    fill(255, 255, 0);
    rect(x, y, 5, 10);
    y = y-speed;
  }
}