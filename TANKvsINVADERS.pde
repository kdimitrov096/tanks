Game game;
Tank tank1;
Bush [] bushes;
boolean Menu = true, Play;
ArrayList<Enemy> enemies;
ArrayList<Bullet> myBullets;
ArrayList<Bullet> eneBullets;



void setup() {
  game = new Game();
  size(750, 650);
  rectMode(CENTER);
  noStroke();
  textSize(30);
  
  tank1 = new Tank();
  enemies = new ArrayList<Enemy>();
  myBullets = new ArrayList<Bullet>();
  eneBullets = new ArrayList<Bullet>();
  bushes = new Bush [5];
  bushes[0] = new Bush();
  bushes[1] = new Bush();
  bushes[2] = new Bush();
  bushes[3] = new Bush();
  bushes[4] = new Bush();
}

void draw() {
  background(0);
  game.StartMenu();
  
  if(Play == true){
  
    
  tank1.draw();
  tank1.move();

  for (Enemy enemy : enemies) {
    enemy.display();
  }
  for (Bullet bullet : myBullets) {
    bullet.display();
  }
  for (Bullet bullet : eneBullets) {
    bullet.display();
  }

  tank1.update();
  ArrayList<Enemy> nextEnemies = new ArrayList<Enemy>();
  for (Enemy enemy : enemies) {
    enemy.update();
    if (!enemy.isDead) {
      nextEnemies.add(enemy);
    }
  }
  enemies = nextEnemies;
  ArrayList<Bullet> nextMyBullets = new ArrayList<Bullet>();
  for (Bullet bullet : myBullets) {
    bullet.updateY();
    if (!bullet.isDeadY) {
      nextMyBullets.add(bullet);
    }
  }
  for (Bullet bullet : myBullets) {
    bullet.updateX();
    if (!bullet.isDeadX) {
      nextMyBullets.add(bullet);
    }
  }

myBullets = nextMyBullets;
ArrayList<Bullet> nextEneBullets = new ArrayList<Bullet>();
for (Bullet bullet : eneBullets) {
  bullet.updateY();
  bullet.updateX();
  if (!bullet.isDeadY) {
    nextEneBullets.add(bullet);
  }
}
eneBullets = nextEneBullets;
if (random(1) < 0.02) {
  enemies.add(new Enemy());
}

bushes[0].draw();
bushes[1].draw();
bushes[2].draw();
bushes[3].draw();
bushes[4].draw();
}
}
