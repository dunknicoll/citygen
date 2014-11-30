Drawbot river;
boolean pressedR = false;
float timer = 0.0;

void setup(){
  size(800,600);
  background(0);
  river = new Drawbot(random(100.0,width-100.0), -10.0, 15, color(20, 20, 255));
}

void draw(){
  background(0);
  river.update();
}

void keyPressed(){
  if ((key == 'r' || key == 'R') && !pressedR) {
      pressedR = true;
      river = new Drawbot(random(100.0,width-100.0), -10.0, 15, color(20, 20, 255));
    }
}

void keyReleased(){
    if ((key == 'r' || key == 'R') && pressedR) {
      pressedR = false;
    }
}
