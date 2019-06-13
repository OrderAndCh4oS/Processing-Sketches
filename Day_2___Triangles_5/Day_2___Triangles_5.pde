int x = 0;
int y = 0;
int angle = 90;
int triangleWidth = 50;
int triangleHeight = 50;

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
      rotate(radians(angle));
      triangle(-triangleWidth/2, -triangleHeight/2, triangleWidth/2, -triangleHeight/2, triangleWidth/2, triangleHeight/2);
      popMatrix();
      x += triangleWidth;
      angle += 90 % 359;
    }
    x = 0;
    y += triangleHeight;
  }
  saveFrame("screen-####.png");
}
