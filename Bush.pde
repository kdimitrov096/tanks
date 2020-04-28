class Bush
{
  PVector position;
  float radius;
  PImage  img;

  Bush()
  {
    position = new PVector (random(0, width), random( 0, height));
    radius = 50;
    img = loadImage("bush.png");
    ;
  }

void draw()
  {
    noStroke();
    image(img, position.x, position.y, radius, radius);
  }
}
