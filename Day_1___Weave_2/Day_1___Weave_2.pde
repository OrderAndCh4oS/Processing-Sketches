float x = 240;
float y = 240;
boolean horizontal = true;
boolean vertical = true;

void setup() {
  size(480, 480);
}

void draw() {
  if (x < 12.5) {
    horizontal = true;
  }
  if (x > 480 - 12.5) {
    horizontal = false;
  }
  if (y < 12.5) {
    vertical = true;
  }
  if (y > 480 - 12.5) {
    vertical = false;
  }


  if (horizontal) {
    x += 2;
  } else {
    x -= 2;
  }

  if (vertical) {
    y += 2.5;
  } else {
    y -= 2.5;
  }
  
  stroke(y / 480 * 255);
  fill(x / 480 * 255);

  ellipse (
    x + (randomGaussian() - 0.5), 
    y + (randomGaussian() - 0.5), 
    25, 
    25
    );

  if (mousePressed) {
    saveFrame("line-######.png");
  }
}
