int length = 200;
float angle = PI;

int count = 0;

float width = 640;
float height = 360;

color bg = color(242, 246, 250);
color[] black = {
  color(13, 19, 25), 
  color(43, 59, 65), 
  color(73, 89, 95), 
  color(103, 119, 125), 
  color(133, 149, 155),
  color(163, 179, 185),
  color(193, 209, 215)
};

int pointSize = 30;
int pointCount = 640;

float multiplier = 2;

float sinValue = 1;
float cosValue = 1;


FadeOut fade = new FadeOut(bg);

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

public class Lissajous {
  float x;
  float y;
  color colour;
  float angle = 0;
  float modSin = 1;
  float modCos = 1;

  public Lissajous(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public Lissajous(float x, float y, float a) {
    this(x, y);
    angle = a;
  }
  
  public void setModifierSin(float mod) {
    this.modSin = mod;
  }
  
  public void setModifierCos(float mod) {
    this.modCos = mod;
  }
  
  public void setColour(color colour) {
    this.colour = colour;
  }

  public void draw() {
    stroke(colour);
    strokeWeight(pointSize);
    pushMatrix();
    translate(x, y);
    float px = sin(angle * modSin) * length - angle;
    float py = cos(angle * modCos) * length - angle;
    point(px, py);
    angle = (angle + 0.01) % (PI * multiplier);    
    popMatrix();
  }
}

Lissajous lissajous = new Lissajous(width/2, height/2, 0);

void setup() {
  frameRate(30);
  background(bg);
  size(640, 360);
  lissajous.setModifierSin(2.0);
  lissajous.setModifierSin(2.0);
}

void draw() {
  background(bg);
  drawLissajous();
  saveFrame("lissajous-####.png");
  count += 1;
  if (count > 250) exit();
}

void drawLissajous() {
  for (int i = 0; i < pointCount/5; i++) {
    for (int j = 0; j < black.length; j++) {
      lissajous.setColour(black[j]);
      lissajous.draw();
    }
  }
}
