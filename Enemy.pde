class Enemy{
  
  PVector loc;
  float vel;
  float size;
  int coolingTime;
  boolean isDead;
  PImage img;
  
  Enemy(){
    size = 25;
    loc = new PVector(random(size / 2, width - size / 2), -size / 2);
    vel = 0.5;
    coolingTime = int(random(120));
    isDead = false;
    img = loadImage("ship.png");
  }
  
  void display(){
    noFill();
    stroke(255, 0, 0);
    image(img, loc.x, loc.y, size, size);
  }

  void update(){
    loc.y += vel;
    if(loc.y > height){
      isDead = true;
    }
    coolingTime++;
    if(coolingTime >= 120){
      eneBullets.add(new Bullet(this));
      coolingTime = 0;
    }
    for(Bullet b: myBullets){
      if((loc.x - size / 2 <= b.loc.x && b.loc.x <= loc.x + size / 2)
         && (loc.y - size / 2 <= b.loc.y && b.loc.y <= loc.y + size / 2)){
        isDead = true;
        b.isDeadY = true;
        break;
      }
    }
  }    
}
