int length = 100;
float angle = 0;

int count = 0;

float width = 640;
float height = 360;

color bg = color(23, 27, 33);
color cyan = color(0, 255, 255);
color magenta = color(255, 0, 255);
color yellow = color(255, 255, 0);

int pointSize = 2;

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

public class Cylinder {
  float x;
  float y;
  color colour;
  float angle = 0;

  public Cylinder(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.colour = c;
  }

  public Cylinder(float x, float y, color c, float a) {
    this(x, y, c);
    angle = a;
  }

  public void cylinder() {
    stroke(colour);
    strokeWeight(pointSize);
    pushMatrix();
    translate(x, y);
    float px = sin(angle) * length - angle;
    float py = cos(angle) * length - angle;
    point(px, py);
    angle += 0.048;
    popMatrix();
  }
}

Cylinder[] cylinders = {
  new Cylinder(0, height, yellow), 
  new Cylinder(width/4, height, cyan), 
  new Cylinder(width/4*2, height, magenta), 
  new Cylinder(width/4*3, height, yellow), 
  new Cylinder(width/4*4, height, cyan),
  new Cylinder(width/4*5, height, magenta), 
  new Cylinder(width/4*6, height, yellow), 
};

void setup() {
  frameRate(30);
  background(23, 27, 33);
  size(640, 360);
  stroke(255);
}

void draw() {
  if (count < 50000) {
    drawCylinders();
  } else {
     fade.draw();
     if (fade.isComplete()) exit();
  }
  saveFrame("cylinders-####.png");
}

void drawCylinders() {
  for (int j = 0; j < cylinders.length; j++) {
    for (int i = 0; i < 45; i++) {
      cylinders[j].cylinder();
    }
    count += 45;
  }
}
