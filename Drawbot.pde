class Drawbot {

  PVector pos = new PVector();
  PVector heading = new PVector();
  int thickness;
  color lineColor;
  float inc = 0.5;
  float time = 0.0;
  float yspeed = 10.0;
  ArrayList<PVector> points = new ArrayList();
  float angle = 0.0;
  float n = 0.0;

  Drawbot(float sX, float sY, int t, color c) {
    pos.set(sX, sY, 0.0);
    time = random(0,1000000);
    thickness = t;
    stroke(c);
    fill(255);
  }

  void update() {
    renderLine();
    renderCircle();
  }

  void renderCircle() {
    if (pos.y < height+10) {
      pushMatrix();
        time += inc;
        angle = ((noise(time)*(PI*2)) - (PI))+PI/2;
        heading = PVector.fromAngle(angle);
        heading.mult(30);
        PVector lastpos = new PVector(pos.x, pos.y, 0.0);
        pos.add(heading);
        pos.set(pos.x, lastpos.y+yspeed, 0.0);
        points.add(new PVector(pos.x, pos.y, 0.0));
        translate(pos.x, pos.y);
        rotate(angle);
        strokeWeight(1);
        ellipse(0, 0, 20, 20);
        line(0, 0, 10, 0);
      popMatrix();
    }
  }

  void renderLine() {
    pushMatrix();
      translate(0, 0);
      strokeWeight(thickness);
      if (points.size()>2) {
        for (int i = 0; i < points.size(); i++) {
          if (i==0) {
            PVector p = points.get(i);
            PVector p2 = points.get(i+1);
            line(p.x-20, p.y-20, p.x, p.y);
            line(p.x, p.y, p2.x, p2.y);
          }
          else if (i+1<points.size()) {
            PVector p = points.get(i);
            PVector p2 = points.get(i+1);
            line(p.x, p.y, p2.x, p2.y);
          } 
          else {
            PVector p = points.get(i);
            line(p.x, p.y, p.x, p.y);
          }
        }
      }
    popMatrix();
  }
}

