import gifAnimation.*;

GifMaker gifExport;

float gravity = 0.5;
float radius = 0.5;
int ballCount = 100;
float y = 0;
Cross[] crosses = new Cross[ballCount];

class Cross {
  float x, y, velocityX, velocityY;
  Cross(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    velocityY = 6;
    velocityX = 10;
  }

  void update() {
    if (y > 500 || y < 0) {
      velocityY = -velocityY;
    }
    if (x > 500 || x < 0) {
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

void setup() {
  frameRate(30);
  background(40);
  size(500, 500);
  stroke(255);
  fill(255);
  gifExport = new GifMaker(this, "export.gif");
  gifExport.setRepeat(0);
  for (int i = 0; i < ballCount; i++) {
    crosses[i] = new Cross(i * 10.0, i * 6);
  }
}

void draw() {
  background(40);
  stroke(255);
  for (int i = 0; i < ballCount; i++) {
    crosses[i].update();
    crosses[i].draw();
  }
}
