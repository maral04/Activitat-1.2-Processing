var canvi = 1;
PFont font;                      // Declarem la font.
PImage[] img = new PImage[4];     // Declarem l'array d'imatge.
var firsttime = true;

void setup() {
  size(1024, 480);
  background(235, 235, 235);
  stroke(255, 255, 255);
  strokeWeight(2);
  frameRate(36); // Editant baixat FPS, al publicar 30-60.

  font = createFont("Arial", true); // Creem la font. Tipus,Tamany,Antialasing.
  img[0] = loadImage("Jelly-Bean-Logo.png");
  img[1] = loadImage("sugar-cube.png");
  img[2] = loadImage("candy-wall.png");

  jelly = new Jelly(width / 2, height / 2);
}

void draw() {

  // 1-Limits pantalla exterior.
  fill(255, 255, 255);
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
  rect(15, 65, 95, 45);
  rect(190, 65, 245, 45);
  rect(495, 65, 255, 45);
  //rect(795, 65, 115, 45);
  image(img[2], 795, 65, 149, 41);
  rect(865, 15, 45, 45);

  //rect(80, 125, 145, 45);
  image(img[2], 75, 125, 149, 41); //148,635 i 41,31
  //rect(395, 145, 145, 45);
  image(img[2], 395, 145, 149, 41);
  //rect(695, 165, 145, 45);
  image(img[2], 695, 165, 149, 41);
  rect(795, 115, 45, 45);
  

  rect(695, 215, 45, 45);
  rect(15, 265, 435, 45);
  //rect(595, 265, 145, 45);
  image(img[2], 595, 265, 149, 41);
  
 

  // 3-Introducció del sucre a recollir.
  image(img[1], 35, 133, 32, 32);
  image(img[1], 240, 133, 32, 32);
  image(img[1], 450, 110, 32, 32);
  image(img[1], 820, 25, 32, 32);
  image(img[1], 705, 120, 32, 32);
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
    fill(235, 235, 235);                  // Color de background
    rect(15, 395, 210, 65);                  // Faig desapareixer el text amb un rectangle a sobre...
    textFont(font, 22);                    // Especificar la font a ser usada. 
    fill(165);                            // Especificar font color.
    text("Sucres: ", 25, 420);              // Mostrar Text.
    text("Clicks: "+releases, 25, 450);     
    
    if (moving) {
      // noStroke();
      fill(195, 195, 195);
    } else {
      stroke(255, 255, 255);
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

