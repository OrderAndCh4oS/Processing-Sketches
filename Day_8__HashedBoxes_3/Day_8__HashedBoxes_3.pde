color bg = color(50, 34, 25);
color black = color(10, 10, 10);
color white = color(250, 250, 253);
int count = 0;
FadeOut fade = new FadeOut(bg);

void drawHashedBox() {
  float angle = random(-PI, PI);
  float length = random(20, 50);
  pushMatrix();
  rotate(angle);
  int x = 0;
  int y = 0;
  for (int i = 0; i < 13; i++) {
    noStroke();
    fill(white);
    rect(x, y, 4, length);
    x += 4;
    fill(black);
    rect(x, y, 4, length);
    x += 4;
  }
  popMatrix();
}


void draw() {
  if (count < 100) {
    for (int i = 0; i < 10; i++) {
      pushMatrix();
      translate(map(count, 0, 100, 0, 640), random(0, 360));
      drawHashedBox();
      popMatrix();
    }
  } else {
    fade.draw();
  }
  saveFrame("f####.png");
  if (fade.isComplete()) exit();
  count++;
}

void setup() {
  background(bg);
  size(640, 360);
  frameRate(24);
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
