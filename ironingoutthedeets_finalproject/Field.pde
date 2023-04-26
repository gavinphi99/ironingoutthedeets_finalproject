class Field {

  float x;
  float y;
  float w;
  float h;

  // Basic styling
  color offColor = color(200);
  color hoverColor = #AACB9C;
  color buttonColor = offColor;

  float hoverWeight = 10;
  float offWeight = 1;
  float weight = offWeight;

  color hoverDetail = #276F09;
  color offDetail = color(0);
  color strokeColor = offDetail;
  color textColor = offDetail;

  Field(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void style(color off, color offDetail) {
    offColor = off;
    this.offDetail = offDetail;
  }

  void hoverStyle(color hover, color hoverDetail) {
    hoverColor = hover;
    this.hoverDetail = hoverDetail;
  }

  boolean intersect(int newX, int newY) {

    if ((newX >= x) && (newX <= x + w) && (newY >= y) && (newY <= y + h)) {
      return true;
    } else {
      return false;
    }
  }

  void drop(int newX, int newY) {

    if (intersect(newX, newY)) {
      buttonColor = hoverColor;
      weight = hoverWeight;
      strokeColor = hoverDetail;
      textColor = hoverDetail;
      //font = hoverFont;
    } else {
      buttonColor = offColor;
      weight = offWeight;
      strokeColor = offDetail;
      textColor = offDetail;
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    fill(buttonColor);
    strokeWeight(weight);
    stroke(strokeColor);
    rect(0, 0, w, h, 20);
    popMatrix();
  }
}
