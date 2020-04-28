class Tank
{
  PVector position; //Position
  PVector velocity;  //Amount it moves on each redraw
  float size;     //radius
  int coolingTime;
  boolean isDead;
  PImage [] img;     //Image


  Tank()
  {
    size = 50;
    position = new PVector (width/2-25, height/2-25);
    velocity = new PVector (-2, -2);
    coolingTime = 0;
    isDead = false;
    
    img = new PImage [4];
    img[0] = loadImage("tankUp.png");
    img[1] = loadImage("tankDown.png");
    img[2] = loadImage("tankRight.png");
    img[3] = loadImage("tankLeft.png");
    
    
  }

  void draw()
  {
    noStroke();
    image(img[0], position.x, position.y, size, size);
  }
  
  void move()
  {
    if (key=='w' && position.y > 0) 
    {
      image(img[0], position.x, position.y, size, size);
      position.y = position.y - 1;
    }

    if (key=='s' && position.y < height-50) 
    {
      image(img[1], position.x, position.y, size, size);
      position.y = position.y + 1;
    }

    if (key=='d' && position.x < width-50) 
    {
      image(img[2], position.x, position.y, size, size);
      position.x = position.x + 1;
    }

    if (key=='a' && position.x > 0) 
    {
      image(img[3], position.x, position.y, size, size);
      position.x = position.x - 1;
    }
  }
  
  void update(){
    isDead = false;
    coolingTime++;
    if(mousePressed && coolingTime >=60){
      myBullets.add(new Bullet());
      coolingTime = 0;
    }
    for(Bullet b: eneBullets){
      if((position.x - size/2 <=b.loc.x && b.loc.x <= position.x + size/2)
      &&(position.y - size/2 <= b.loc.y && b.loc.y <=position.y + size/2)){
        isDead = true;
        b.isDeadY = true;
        b.isDeadX = true;
        break;
      }
    }
    for(Enemy e: enemies){
      if(abs(position.x - e.loc.x) < size/2 + e.size/2 && abs(position.y - e.loc.y) < size/2 + e.size/2){
        isDead = true;
        e.isDead = true;
        break;
      }
    }
  }
}
  
