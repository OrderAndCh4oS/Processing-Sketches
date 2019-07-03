 //<>//
color bg = color(20, 20, 40);
color c = color(190, 160, 30);

Line[] lines = new Line[100];

void setup() {
  frameRate(24);
  background(bg);
  size(640, 360);
  for (int i = 0; i < 100; i++) {
    int x = (int) map(i, 0, 100, 0, 644);
    lines[i] = new Line(x, 360, color(190, 160, 30), 1, 360, (float)random(0, 100));
  }
  for (int i = 0; i < 100; i++) {
    lines[i].draw();
  }
}

void draw() {
  background(bg);
  for (int i = 0; i < 100; i++) {
    lines[i].draw();
  }
  saveFrame("f####.png");
}



class Line {
  int x; 
  int y; 
  color strokeColour;
  int strokeThickness;
  float currentLength;
  float maxLength;
  float minLength;
  int iteration = 0;
  boolean isForward = true;
  int loop = 0;

  Line(
    int x, 
    int y, 
    color strokeColour, 
    int strokeThickness, 
    float minLength, 
    float maxLength
    ) {
    this.x = x;
    this.y = y;
    this.strokeColour = strokeColour;
    this.strokeThickness = strokeThickness;
    this.minLength = minLength;
    this.maxLength = maxLength;
    this.currentLength = minLength;
  }

  void draw() {
    if (iteration % (int)((maxLength - minLength) / 4) == 0 || iteration == 0) {
      isForward = !isForward;
      loop++;
    }
    if (loop >= 6) {
      isForward = true;
    }
    strokeWeight(strokeThickness);
    stroke(strokeColour);
    line(x, y, x, currentLength);
    if (isForward) {
      currentLength += 4;
    } else {
      currentLength -= 4;
    }
    iteration = (iteration + 1) % (int)(maxLength - minLength);
  }
}
