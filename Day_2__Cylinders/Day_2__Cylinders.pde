int length = 100;
float angle = 0;

void setup() {
  frameRate(10);
  background(40);
  size(500, 500);
  stroke(255);
  fill(255);
}

void cylinder(float x) {
  pushMatrix();
  translate(x, height);
  point(sin(angle) * length - angle, cos(angle) * length - angle);
  angle += 0.015;
  popMatrix();
}

void draw() {
  cylinder(width/10);
  cylinder(width/2);
  cylinder(width/10*9);
  cylinder(width/10*13);
  cylinder(width/10*17);
}
