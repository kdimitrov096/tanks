class Game {
  float B1Alpha = 100, B2Alpha = 100, B3Alpha = 100;
  String Leveltext = "Easy";
  int Level = 1;

  void StartMenu () {
    fill(50, 15, 200, B2Alpha);
    rect(width/2, height/2, 200, 50, 5);
    fill(255);
    text(Leveltext, (width /2) - (textWidth(Leveltext) / 2), (height/2) + ((textAscent() - textDescent()) / 2));
    fill(50, 15, 200, B1Alpha);
    rect(width/2, height/2 - 75, 200, 50, 5);
    fill(255);
    text("Play", (width /2) - (textWidth("Play") / 2), (height/2) + ((textAscent() - textDescent()) / 2) - 75);
    fill(50, 15, 200, B3Alpha);
    rect(width/2, height/2 + 75, 200, 50, 5);
    fill(255);
    text("Quit", (width /2) - (textWidth("Quit") / 2), (height/2) + ((textAscent() - textDescent()) / 2) + 75);
    if (Menu) {
      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height/2 - 75 - 25 && mouseY < height/2 - 75 + 25) {
        if (mousePressed) {         
          Menu = false;
        }
        if (B1Alpha < 150) {
          B1Alpha += 5;
        }
      } else if (B1Alpha > 100) {
        B1Alpha -= 5;
      }

      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height/2 - 25 && mouseY < height/2 + 25) {
        if (mousePressed) {
          Level ++;
          if (Level > 3) {
            Level = 1;
          }
          switch (Level) {
          case 1:
            Leveltext = "Easy";
            break;
          case 2:
            Leveltext = "Normal";
            break;
          case 3:
            Leveltext = "Hard";
            break;
          }
          delay(50);
        }
        if (B2Alpha < 150) {
          B2Alpha += 5;
        }
      } else if (B2Alpha > 100) {
        B2Alpha -= 5;
      }

      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height/2 + 75 - 25 && mouseY < height/2 + 75 + 25) {
        if (mousePressed) {
          exit();
        }
        if (B3Alpha < 150) {
          B3Alpha += 5;
        }
      } else if (B3Alpha > 100) {
        B3Alpha -= 5;
      }
    }
    if (!Menu) {
      if (B1Alpha > 0) {
        B1Alpha -= 5;
      }
      if (B2Alpha > 0) {
        B2Alpha -= 5;
      }
      if (B3Alpha > 0) {
        B3Alpha -= 5;
      }
    }
    if (B1Alpha == 0 && B2Alpha == 0 && B3Alpha == 0) {
      Play = true;
    }
  }
}
