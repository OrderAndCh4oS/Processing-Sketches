int x = 0;
int y = 0;
int angle = 90;
int triangleWidth = 50;
int triangleHeight = 50;
int step = 0;
int count = 0;

void setup() {
  frameRate(30);
  size(500, 500);
  background(51);
}

void draw() {
  background(51);
  stroke(255);
  x = 0;
  y = 0;
  for (int i = 0; i <= 500 / triangleWidth; i++) {
    for (int j = 0; j <= 500 / triangleHeight; j++) {
      pushMatrix();
      translate(x, y);
      int multiplier = step * angle % 360;
      rotate(radians(angle * multiplier));
      triangle(-triangleWidth/2, -triangleHeight/2, triangleWidth/2, -triangleHeight/2, triangleWidth/2, triangleHeight/2);
      popMatrix();
      x += triangleWidth;
      if (count % 20 > 10) {
        step = step + 3 % 4;
      } else {
        step = step + 2 % 4;
      }
    }
    if (count % 20 <= 10) {
      step = step + 1 % 4;
    } else {
      step = step + 2 % 4;
    }
    x = 0;
    y += triangleHeight;
  }
  count++;
  saveFrame("screen-####.png");
}
