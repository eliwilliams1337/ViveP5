import core.viveP5.*;

Vive vive;

void setup() {           
  size(1028, 1028, P3D);
  vive = new Vive(this);
}

void draw() {
  vive.draw();
  vive.setBackground(200,100,150);
}
void VRdraw(){
  for (int i = -1000; i < 1000; i+=200) {
    for (int j = -1000; j < 1000; j += 200) {
      for (int k = 0; k < 1000; k += 200) {
        pushMatrix();
        translate(i, j, k);
        fill(255, 120, 140);
        rotateX(millis() / 1000.0f);
        rotateY(millis() / 900.0f);
        box(50);
        popMatrix();
      }
    }
  }
}
