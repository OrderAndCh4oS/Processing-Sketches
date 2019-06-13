
int length = 100;
float angle = 0;
int start = 0;
int end = 400;
float angleIncrement = 0.02;


void setup() {
  frameRate(30);
  background(40);
  size(500, 500);
  stroke(255);
  fill(255);
}

void cross(float x, float y) {
  line(x-2, y-2, x+2, y+2);
  line(x-2, y+2, x+2, y-2);
}

void cylinder(float x, int strokeColour) {
  pushMatrix();
  translate(x, height/3 * 2);
  stroke(strokeColour);
  cross(sin(angle) * length - angle, cos(angle) * length - angle);
  angle += angleIncrement;
  popMatrix();
}

void draw() {
  background(40);
  for (int i = start; i < end; i++) {
    for (int j = 0; j < 3; j++) {
      cylinder(width/10, 255);
      cylinder(width/2, 230);
      cylinder(width/10*9, 205);
      cylinder(width/10*13, 180);
      cylinder(width/10*17, 155);
    }
  }
  end++;
  start = end - 500;
  angle = start * angleIncrement;
  if (end > 600) {
      saveFrame("screen-####.png");
  }
}
