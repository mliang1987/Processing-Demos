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

  void show() {
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

  void changeSpeed(int xs, int ys) {
    x_speed = xs;
    y_speed = ys;
  }
}