var canvi = 1;
float bx;
float by;
int boxSize = 75;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
PFont font;// Declarem l'Objecte font

void setup() {
  size(1024, 480);
  background(235, 235, 235);
  stroke(255,255,255);
  strokeWeight(2);
  frameRate(16); // Editant baixat FPS, al publicar 30-60.
  
  font = createFont("Arial",true); // Creem la font. Tipus,Tamany,Antialasing.
  
  ball = new Ball(width / 2, height / 2);
}

void draw() {
    //Punt Inicial
    ball.move();
    ball.draw();
  
  //ellipse(150,88,25,25);
  
  //noStroke();
  //Limits pantalla exterior.
  
  fill(255, 255, 255);
  //Limit superior. ^ · >
  rect(0, 0, 1024, 5);
  //Limit dreta. > · ^
  rect(1024, 0, -5, 480);
  //Limit inferior.  · >
  rect(0, 480, 1024, -5);
  //Limit esquerra. < · ^
  rect(0, 0, 5, 480);
  
  //Creació limits laberint interior.
  fill(0, 255, 5);
  rect(17,65,95,45);
  rect(190, 65, 245, 45);
  rect(495, 65, 255, 45);
  rect(795, 65, 115, 45);
  rect(865,15,45,45);
  
  rect(80,125,145,45);
  rect(395,145,145,45);
  rect(695,165,145,45);
  rect(795,115,45,45);
  
  rect(695,215,45,45);
  rect(15, 265, 435, 45);
  rect(575, 265, 165, 45);
  
  
  /*
  //Sombrejat interior
  fill(0, 210, 5);
  rect(70, 90, 885, 4);
  */
  /*
  if (mouseButton == LEFT) {
    fill(0, 245, 220);
    rect(mouseX-22, mouseY-22, 45, 45);
  }
  if (mouseButton == RIGHT){
    //Para de dibuixar.
  }
  */
  
  /*
  if (mouseButton == RIGHT){
    if(canvi != 1){
      canvi = 1;
      stroke(0, 0, 0);
    }else{
      if (canvi != 2){
        canvi = 2;
        stroke(255, 255, 255);
      }
    }
  }*/
  

}

void mousePressed() {
    if (ball.mouseOver(mouseX, mouseY)) {
        ball.mousePressed();
    }
}

void mouseReleased() {
    ball.mouseReleased();
}

void released(){
  ball.released();
}

class Ball {
    int x, y;
    int radius;
    int releases = 0;
    
    Ball(int x, int y) {
        this.x = x;
        this.y = y;
        this.radius = 25;
    }
 
    boolean moving = false;
 
    void mousePressed() {
        moving = true;
    }
    
    void mouseReleased() {
        moving = false;
        releases++;
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
        rect(20,425,230,35);                  // Faig desapareixer el text amb un rectangle a sobre...
        textFont(font,22);                    // Especificar la font a ser usada. 
        fill(165);                            // Especificar font color.
        text("De-Clicks: "+releases,30,450);  // Mostrar Text.
        if (moving) {
           // noStroke();
           fill(195, 195, 195);
        } else {
            stroke(255,255,255);
            //fill(0, 255, 5);
            fill(0, 245, 220);
        }
        ellipse(x, y, radius, radius);
    }
}
