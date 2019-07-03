color bg = color(50, 34, 25);
color black = color(30, 30, 120);
color white = color(250, 250, 253);
int count = 0;

HashedBox box = new HashedBox(1000, 360);

FadeOut fade = new FadeOut(bg);

void draw() {
  if (count < 49) {
    box.draw();
  } else {
     exit();
  }
  saveFrame("f####.png");
  count++;
}

void setup() {
  background(bg);
  size(640, 360);
  frameRate(24);
}

class HashedBox {
  float width;
  float height;
  float angle = 0;

  public HashedBox() {
    this(100, 100);
  }
  public HashedBox(float size) {
    this(size, size);
  }
  public HashedBox(float width, float height) {
    this.width = width;
    this.height = height;
  }

  void draw() {
    pushMatrix();
    rotate(angle);
    int x = 0;
    int y = 0;
    for (int i = 0; i < width / 4; i++) {
      noStroke();
      fill(white);
      rect(x, y, 4, height);
      x += 4;
      fill(black);
      rect(x, y, 4, height);
      x += 4;
    }
    popMatrix();
    angle += PI / 24;
  }
}

public class FadeOut {
  color c = color(0, 0, 0);
  float frames = 24;  
  float alpha = 0;
  int currentFrame = 0;
  int holdEndFrame = 12;
  int holdBlankFrame = 6;

  public FadeOut() {
  }
  public FadeOut(color colour) {
    this.c = colour;
  }
  public FadeOut(color colour, float frames) {
    this.c = colour;
    this.frames = frames;
  }

  public void draw() {
    if (holdEndFrame >= 0) {
      holdEndFrame -= 1;
    } else if (currentFrame <= frames) {
      currentFrame++;
      alpha = currentFrame / frames;
      stroke(c);
      fill(c, alpha * 255);
      rect(0, 0, 640, 360);
    } else if (holdBlankFrame >= 0) {
      holdBlankFrame -= 1;
    }
  }

  public boolean isComplete() {
    return currentFrame >= frames && holdEndFrame <= 0 && holdBlankFrame <= 0;
  }
}
