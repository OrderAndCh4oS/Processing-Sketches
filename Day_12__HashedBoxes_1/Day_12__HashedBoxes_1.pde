color bg = #143340;
color black = #0F2426;
color white = #BFCDD9;
int count = 0;

int boxCount = 5;

int iterations = 60;

HashedBox[] boxes = new HashedBox[boxCount];

FadeOut fade = new FadeOut(bg);

void draw() {
  background(bg);
  if (count < iterations*6) {
    for (int i = 0; i < boxCount; i++)
      boxes[i].draw();
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
  for (int i = 0; i < boxCount; i++) {
    boxes[i] = new HashedBox(640 - map(i, 1, 5, 0, 640), 360 - map(i, 1, 5, 0, 360), map(i, 0, 5, 1, 3));
  }
}

class HashedBox {
  float width;
  float height;
  float speed;
  float angle = 0;

  public HashedBox() {
    this(100, 100, 1);
  }
  public HashedBox(float size) {
    this(size, size, 1);
  }
  public HashedBox(float width, float height, float speed) {
    this.width = width;
    this.height = height;
    this.speed = speed;
  }

  void draw() {
    pushMatrix();
    translate(320, 180);
    rotate(angle);
    float x = -width;
    float y = -(height/2);
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
    angle += PI / 60 * speed;
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
