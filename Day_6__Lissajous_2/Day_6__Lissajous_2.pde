int length = 140;
float angle = PI;

int count = 0;

float width = 640;
float height = 360;

color bg = color(23, 27, 33);
color cyan = color(0, 255, 255);
color magenta = color(255, 0, 255);
color yellow = color(255, 255, 0);

int pointSize = 6;
int pointCount = 200;

FadeOut fade = new FadeOut(bg);

public class FadeOut {
   color c = color(0, 0, 0);
   float frames = 24;  
   float alpha = 0;
   int currentFrame = 0;
   int holdEndFrame = 12;
   int holdBlankFrame = 6;
   public FadeOut() {}
   public FadeOut(color colour) {
     this.c = colour;
   }
   public FadeOut(color colour, float frames) {
     this.c = colour;
     this.frames = frames;
   }
   
   public void draw(){
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

  public Lissajous(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.colour = c;
  }

  public Lissajous(float x, float y, color c, float a) {
    this(x, y, c);
    angle = a;
  }

  public void draw() {
    stroke(colour);
    strokeWeight(pointSize);
    pushMatrix();
    translate(x, y);
    float px = sin(angle*48) * length - angle;
    float py = cos(angle*36) * length - angle;
    point(px, py);
    angle = (angle + 0.12) % (PI * 2);    
    popMatrix();
  }
}

Lissajous[] lissajousArr = {
  new Lissajous(width/2, height/2, cyan, 0), 
  new Lissajous(width/2, height/2, magenta, (angle + 0.12 * pointCount)), 
  new Lissajous(width/2, height/2, yellow, (angle + 0.12 * (pointCount * 2))), 
};

void setup() {
  frameRate(30);
  background(bg);
  size(640, 360);
}

void draw() {
  background(bg);
  drawLissajous();
  saveFrame("lissajous-####.png");
  count += 1;
  if (count > 250) exit();
}

void drawLissajous() {
  for (int j = 0; j < lissajousArr.length; j++) {
    for (int i = 0; i < pointCount; i++) {
      lissajousArr[j].draw();
    }
  }
}
