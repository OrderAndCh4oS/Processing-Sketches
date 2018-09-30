int x = 0;
int y = 0;
int angle = 0;
int triangleWidth = 10;
int triangleHeight = 10;

void setup() {
  background(51);
  size(500, 500);
}

void draw() {
  background(51);
  stroke(255);
  x = 0;
  y = 0;
  for (int i = 0; i < 500 / triangleWidth; i++) {
    for (int j = 0; j < 500 / triangleHeight; j++) {
      pushMatrix();
      translate(x + triangleWidth/2, y + triangleHeight/2);
      angle += 2;
      rotate(radians(angle));
      triangle(-triangleWidth/2, -triangleHeight/2, triangleWidth/2, -triangleHeight/2, triangleWidth/2, triangleHeight/2);
      popMatrix();
      x += triangleWidth;
    }
    x = 0;
    y += triangleHeight;
  }
}
