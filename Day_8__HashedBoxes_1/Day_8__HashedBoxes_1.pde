void drawHashedBox() {
  float angle = random(-PI, PI);
  float length = random(20, 50);
  pushMatrix();
  rotate(angle);
  int x = 0;
  int y = 0;
  for (int i = 0; i < 10; i++) {
    rect(x, y, 4, length);
    x += 4;
  }
  popMatrix();
}

void draw() {
  for (int i = 0; i < 100; i++) {
     translate(random(0, 640), random(0, 360));
     drawHashedBox();
  }
}

void setup() {
  size(640, 360);
  frameRate(24);
}
