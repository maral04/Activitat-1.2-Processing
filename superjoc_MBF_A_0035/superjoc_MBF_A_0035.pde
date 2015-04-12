var canvi = 1;
PFont font;                      // Declarem la font.
PImage[] img = new PImage[4];     // Declarem l'array d'imatge.
var firsttime = true;

void setup() {
  size(1024, 480);
  background(235, 235, 235);
  //stroke(255, 255, 255);
  //strokeWeight(2);
  noStroke();
  frameRate(36); // Editant baixat FPS, al publicar 30-44-60.

  //font = loadFont("SnackerComic_PerosnalUseOnly.ttf");
  //font = loadFont("Snacker Comic Personal Use Only Normal.ttf");
  //font = loadFont("Snacker Comic Personal Use Only Normal");
  //font = createFont("SnackerComic_PerosnalUseOnly.ttf", true); // Creem la font. Tipus,Tamany,Antialasing.
  //font = createFont("Snacker Comic Personal Use Only Normal", true);
  
  //font = loadFont("Amandes Salées Normal, true");
  
  
  font = createFont("Arial", true);
  img[0] = loadImage("Jelly-Bean-Logo.png");
  img[1] = loadImage("sugar-cube.png");
  img[2] = loadImage("candy-wall.png"); //1468 x 408 -> 148,635 x 41,31 | 240,7887 x 66,9222
  img[3] = loadImage("candy-wall-small.png"); //1774 x 882 -> 88,7 x 44,1
  img[4] = loadImage("Salt.png"); //64 x 64 -> 34 x 34

  jelly = new Jelly(width / 2, height / 2);
}

void draw() {

  // 1-Limits pantalla exterior.
  fill(255, 55, 106);
  //Limit superior. ^ · >
  rect(0, 0, 1024, 5);
  //Limit dreta. > · ^
  rect(1024, 0, -5, 480);
  //Limit inferior.  · >
  rect(0, 480, 1024, -5);
  //Limit esquerra. < · ^
  rect(0, 0, 5, 480);

  // 2-Limits laberint interior.
  fill(0, 255, 5);
  //rect(15, 65, 95, 45);

  img[3].resize(89, 44);
  //smooth();
  img[4].resize(34, 34);

  image(img[3], 15, 65);
  //rect(190, 65, 245, 45);
  image(img[2], 190, 55, 241, 67); 
  //rect(495, 65, 255, 45);
  image(img[2], 495, 55, 241, 67); 
  //rect(795, 65, 115, 45);
  image(img[2], 795, 65, 149, 41);
  //rect(865, 15, 45, 45);
  image(img[3], 865, 15);

  //rect(80, 125, 145, 45);
  image(img[2], 75, 125, 149, 41); 
  //rect(395, 145, 145, 45);
  image(img[2], 395, 145, 149, 41);
  //rect(695, 165, 145, 45);
  image(img[2], 695, 165, 149, 41);
  //rect(795, 115, 45, 45);
  image(img[3], 795, 115);


  //rect(695, 215, 45, 45);
  image(img[3], 695, 215);
  //rect(15, 265, 435, 45);
  image(img[2], 15, 265, 241, 67); 
  image(img[2], 255, 265, 241, 67); 
  //rect(595, 265, 145, 45);
  image(img[2], 595, 265, 149, 41);

  // 3-Introducció del sucre i sal a recollir.
  image(img[4], 35, 15);
  image(img[4], 70, 15);
  image(img[4], 30, 125);
  image(img[1], 240, 133, 32, 32);
  image(img[1], 450, 110, 32, 32);
  image(img[1], 820, 25, 32, 32);
  image(img[1], 705, 130, 32, 32);
  //image(img[1], 705, 120, 32, 32);

  // 4-Creació de la pilota i crida dels seus metodes.
  jelly.move();
  jelly.draw();
  firsttime = false;
}

void mousePressed() {
  if (jelly.mouseOver(mouseX, mouseY)) {
    jelly.mousePressed();
  }
}

void mouseReleased() {
  jelly.mouseReleased();
}

void released() {
  jelly.released();
}

class Jelly {
  int x, y;
  int radius;
  int releases = 0;

  Jelly(int x, int y) {
    this.x = x;
    this.y = y;
    this.radius = 40;
  }

  boolean moving = false;

  void mousePressed() {
    releases++;
    moving = true;
  }

  void mouseReleased() {
    moving = false;
  }

  boolean mouseOver(int mx, int my) {
    return ((x - mx)*(x - mx) + (y - my)*(y - my)) <= radius*radius;
  }

  void move() {
    if (moving) {

      this.x = mouseX;
      this.y = mouseY;
    }
  }

  void draw() {
    fill(250, 250, 250);                  // Color de background.
    rect(15, 400, 210, 65);               // Faig desapareixer el text amb un rectangle a sobre...
    textFont(font, 22);                   // Especificar la font a ser usada. 
    fill(165);                            // Especificar font color.
    text("Sucres: ", 25, 425);            // Mostrar Text amb puntuació.
    text("Clicks: "+releases, 25, 455);   // Mostrar Text amb clicks.

    if (moving) {
      // noStroke();
      fill(195, 195, 195);
    } else {
      //stroke(255, 255, 255);
      //fill(0, 255, 5);
      fill(0, 245, 220);
    }

    // Posició inicial.
    if (firsttime == true) {
      x = 150;
      y = 88;
    }

    //ellipse(x, y, radius, radius);
    image(img[0], x, y, radius, radius);
  }
}

