import core.viveP5.*;

Vive vive;
PShape bounds = new PShape();

float rotx, roty;

void setup() {
  size(1028, 1028, P3D);
  vive = new Vive(this);
  vive.setBackground(255, 160, 122);
  bounds = createShape();
  bounds();
}

public void draw() {  
  for(Controller c: vive.controllers) {
    if(c.getTrigger()){
      //paint
    }
    if(c.getPad()){
      //erase
    }
  }
  
  vive.draw();

  surface.setTitle("" + frameRate);
}

void VRdraw() {
  for (int i = 0; i < 4; i++) {
    shape(bounds);
    bounds.rotateY(PI/2);
  }
  
  floorGrid();
  drawBoxes();
}

void bounds() {
  pushMatrix();
  bounds.beginShape(POLYGON);
  bounds.noStroke();
  bounds.fill(255, 160, 122);
  bounds.vertex(-5000,-5000,-5000);
  bounds.fill(255);
  bounds.vertex(-5000,0,-5000);
  bounds.fill(255);
  bounds.vertex(5000,0,-5000);
  bounds.fill(255, 160, 122);
  bounds.vertex(5000,-5000,-5000);
  bounds.endShape();
  popMatrix();
  bounds.scale(2);
}

void floorGrid() {
  stroke(120, 13);
  strokeWeight(2);
  for (int i = -5000; i < 5000; i += 1000) {
    line(i, 0, -5000, i, 0, 5000);
  }
  
  for (int i = -5000; i < 5000; i += 1000) {
    line(-5000, 0, i, 5000,0,i);
  }
}

void drawBoxes() {
  for (int i = -1000; i < 1000; i+=200) {
    for (int j = -1000; j < 1000; j += 200) {
      for (int k = -2000; k < 0; k += 200) {
        pushMatrix();
        translate(i, k, j);
        fill(255, 105, 170);
        rotateX(millis() / 1000.0f);
        rotateY(millis() / 900.0f);
        box(50);
        popMatrix();
      }
    }
  }
}
  
