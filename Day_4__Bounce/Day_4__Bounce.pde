
float gravity = 0.5;
float radius = 0.5;
float y = 0;

int count = 0;

color bg = color(31, 25, 44);

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

class CrossCollection {
  int ballCount = 50;
  Cross[] crosses = new Cross[ballCount];  
  
  public CrossCollection(float xOffset, float yOffset) {
    for (int i = 0; i < ballCount; i++) {
      crosses[i] = new Cross(i * xOffset, i * yOffset, yOffset, xOffset);
    }
  }

  public void draw() {
    stroke(255);
    for (int i = 0; i < ballCount; i++) {
      crosses[i].update();
      crosses[i].draw();
    }
  }
}

class Cross {
  float x, y, velocityX, velocityY;
  
  Cross(float x, float y, float velocityX, float velocityY) {
    this.x = x;
    this.y = y;
    this.velocityY = velocityX;
    this.velocityX = velocityY;
  }

  void update() {
    if (y > 360 || y < 0) {
      velocityY = -velocityY;
    }
    if (x > 640 || x < 0) {
      velocityX = -velocityX;
    }
    y += velocityY;
    x += velocityX;
  }

  void draw() {
    line(x-2, y-2, x+2, y+2);
    line(x-2, y+2, x+2, y-2);
  }
}

CrossCollection[] crossCollections = new CrossCollection[15];

void setup() {
  frameRate(30);
  background(bg);
  size(640, 360);
  stroke(255);
  fill(255);
  for(int i = 0; i < 11; i++) {
    crossCollections[i] = new CrossCollection(1 + i, 6);
  }
}

void draw() {
  background(bg);
  for(int i = 0; i < 11; i++) {
    crossCollections[i].draw();
  }
  count++;
  if (count > 300) {
     fade.draw();
     if (fade.isComplete()) exit();
  }
  saveFrame("screen-####.png");
}
