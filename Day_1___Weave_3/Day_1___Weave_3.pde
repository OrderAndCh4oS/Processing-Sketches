float x = random(160);
float y = -25;
boolean horizontal = true;
boolean vertical = true;

int iterations = 0;
int maxIterations = (int) random(100, 150);

float opacity = 0;
float fade = 0.2;

color bg = color(120, 120, 120);

int stillCountdown = 18;

void setup() {
  size(640, 360);
  background(bg);
  frameRate(24);
}

boolean isComplete(float x, float y) {
   return (
    x < -25 ||
    y < -25 ||
    x > 665 ||
    y > 385
    );
}

void draw() {
  iterations++;
  println(iterations);
  for (int i = 0; i < 20; i++) { 
    if (iterations < maxIterations) {
      if (x < 12.5) {
        horizontal = true;
      }
      if (x > 640 - 12.5) {
        horizontal = false;
      }
      if (y < 12.5) {
        vertical = true;
      }
      if (y > 360 - 12.5) {
        vertical = false;
      }
    }

    if (horizontal) {
      x += 2;
    } else {
      x -= 2;
    }

    if (vertical) {
      y += 2;
    } else {
      y -= 2;
    }

    x += (randomGaussian() - 0.5) * 0.9;
    y += (randomGaussian() - 0.5) * 0.5;

    ellipse (x, y, 25, 25);
  }

  if (iterations >= maxIterations && isComplete(x, y)) {
    stillCountdown = stillCountdown - 1;
    if(stillCountdown < 0) {
      fade *= 1.1;
      opacity += fade ;
      fill(120, 120, 120, (opacity/2) * 255);
      rect(0, 0, 640, 360);
    }
  }
  if (opacity/2 > 5) {
    exit();
  }
  
  saveFrame("line-####.png");
}
