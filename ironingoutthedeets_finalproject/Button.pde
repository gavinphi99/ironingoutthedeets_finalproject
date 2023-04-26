class Button {

  float x;
  float y;
  float w = 20;
  float h = 10;

  String content = "Button";

  // Basic styling
  color offColor = color(200);
  color hoverColor = #AACB9C;
  color buttonColor = offColor;

  float hoverWeight = 3;
  float offWeight = 1;
  float weight = offWeight;

  color hoverDetail = #276F09;
  color offDetail = color(0);
  color strokeColor = offDetail;
  color textColor = offDetail;

  //PFont offFont;
  //PFont hoverFont;
  //PFont font = offFont;

  // take in PFont eventually
  Button(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    //offFont = regular;
    //hoverFont = regular;
  }

  void style(color off, color offDetail) {
    offColor = off;
    this.offDetail = offDetail;
  }

  void hoverStyle(color hover, color hoverDetail) {
    hoverColor = hover;
    this.hoverDetail = hoverDetail;
  }

  //void fontStyle(PFont offFont, PFont hoverFont){
  //  this.offFont = offFont;
  //  this.hoverFont = hoverFont;
  //}

  boolean intersect(int newX, int newY) {
    if ((newX >= x) && (newX <= x + w) && (newY >= y) && (newY <= y + h)) {
      return true;
    } else {
      return false;
    }
  }

  void hover(int newX, int newY) {
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
    float textw = textWidth(content);
    float textsize = 18;

    if (w < textw) {
      w = textw*2;
    }
    if (h < textsize) {
      h = textsize*2;
    }

    pushMatrix();
    translate(x, y);
    fill(buttonColor);
    strokeWeight(weight);
    stroke(strokeColor);
    rect(0, 0, w, h, 10);
    fill(textColor);
    //textFont(font, textsize);
    textSize(textsize);
    text(content, (w/2) - (textw/2), (h/2) - (textsize/2) - (textsize/8), w, h);
    popMatrix();
  }
}
