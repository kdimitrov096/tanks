class Bullet {

  PVector loc;
  float velY,velX;
  boolean isMineY;
  boolean isMineX;
  boolean isDeadY;
  boolean isDeadX;

  Bullet() {
    loc = new PVector(tank1.position.x+25, tank1.position.y);
    //velY = -5;
    //velX = 5;
    isMineY = true;
    isMineX = true;

    if (key=='w') {

      loc = new PVector(tank1.position.x+25, tank1.position.y);
      velY = -1;
      isMineY = true;
    }
    if (key=='s') {

      loc = new PVector(tank1.position.x+25, tank1.position.y);
      velY = 1;
      isMineY = true;
    }
    if (key=='d') {

      loc = new PVector(tank1.position.x+50, tank1.position.y+25);
      velX = 1;
      isMineX = true;
    }
     if (key=='a') {

      loc = new PVector(tank1.position.x, tank1.position.y+25);
      velX = -1;
      isMineX = true;
    }
  }

  Bullet(Enemy enemy) {
    loc = new PVector(enemy.loc.x, enemy.loc.y);
    velY = 5;
    isMineY = false;
  }



  void display() {
    if (isMineY) {
      stroke(255, 115, 0);
    } else {
      stroke(38, 152, 2);
    }
    line(loc.x, loc.y, loc.x, loc.y + velY);
  
   if (isMineX) {
      stroke(255, 115, 0);
    } else {
      stroke(38, 152, 2);
    }
    line(loc.x, loc.y, loc.x, loc.y + velX);
  }

  void updateY() {
    loc.y += velY;
    if ((velY > 0 && loc.y > height) || (velY < 0 && loc.y < 0)) {
      isDeadY = true;
    }
  }  

  void updateX() {
    loc.x += velX;
    if ((velX > 0 && loc.x > width) || (velX < 0 && loc.x < 0)) {
      isDeadX = true;
    }
  }

  //void keyPressed(){
  //  if (key == 'd') {
  //    loc.x += vel;
  //  } else if ((vel > 0 && loc.x > width) || (vel < 0 && loc.x < 0)) {
  //    isDead = true;
  //  }
  //}
}
