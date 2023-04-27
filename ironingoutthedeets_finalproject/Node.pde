class Node {

  float x, y, r;

  String label;

  int index;

  boolean visited;

  boolean overlap;
  
  color off = accents[1];
  color selected = accents[0];
  boolean isSelected = false;
  color c = off;
  boolean drag;
  boolean timer = false;
  float startTime, lightRadius;
  float pulseSpeed = 0.4;
  float duration = 1000;

  Node(String label, int index, float x, float y, float r, color c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
    this.label = label;
    this.visited = false;
    this.index = index;
  }

  Node(String label) {
    this.label = label;
    this.visited = false;
    x = width / 2;
    y = height / 2;
    r = 50;
    index = 0;
  }

  //------------------------------------------------------

  int getIndex() {
    return this.index;
  }

  //------------------------------------------------------

  void set_visited(boolean bool) {
    this.visited = bool;
  }

  //------------------------------------------------------

  boolean was_visited() {
    return visited;
  }

  //------------------------------------------------------

  String get_label() {
    return label;
  }

  //------------------------------------------------------

  void dragNode() {
    if (dist(mouseX, mouseY, x, y) < r) {
      if (mousePressed) {
        x = mouseX;
        y = mouseY;
      }
    }
  }

  //------------------------------------------------------

  boolean overlap(ArrayList<Node> nodes) {
    for (int i = 0; i < nodes.size(); i++) {
      Node other = nodes.get(i);
      float distBtwCenters = dist(x, y, other.x, other.y);
      if (distBtwCenters >= r + other.r && !other.equals(this)) {
        return true;
      }
    }
    return false;
  }

  void createNode() {

    noStroke();
    // displayed circle
    if (isSelected) {
      c = selected;
    }
    else {
      c = off;
    }
    fill(c);
    ellipse(x, y, (r + lightRadius), (r + lightRadius));
    // add text to where the value shows on it

    // pulsating light
    fill(168, 218, 220);
    ellipse(x, y, r, r);

    fill(0);
    pushMatrix();  // save the current transformation matrix
    translate(x, y);  // move the origin to the point on the circle
    text(label, 0, 0);  // draw the text centered at the origin
    popMatrix();  // restore the previous transformation matrix
  }

  boolean isMouseOver() {
    return dist(mouseX, mouseY, x, y) < r;
  }

  void startDrag() {
    drag = true;
  }

  void stopDrag() {
    drag = false;
  }

  void updatePosition() {
    if (drag) {
      x = mouseX;
      y = mouseY;
    }
  }

  //void showLabel(ArrayList<Node> nodes) {
  //  for (int i = 0; i < nodes.size(); i++) {

  //  }
  //}

  //void drawLines(ArrayList<Edge> edges) {
  //  strokeWeight(1);
  //  stroke(0);
  //  for (int i = 0; i < edges.size(); i++) {
  //    Edge e = edges.get(i);
  //    if (other != this) {
  //      line(e., y, other.x, other.y);
  //    }
  //  }
  //}

  void pulse() {
    if (dist(mouseX, mouseY, x, y) < r) {
      lightRadius += pulseSpeed;
      if (!timer) {
        startTime = millis();
        timer = true;
      }
    } else {
      lightRadius = 0;
      timer = false;
    }
    if (timer && millis() - startTime >= duration) {
      lightRadius = 0;
      timer = false;
    }
  }

  void select() {
    if (!isSelected) {
      isSelected = true;
    }
    //ellipse(x, y, (r + lightRadius), (r + lightRadius));
    //lightRadius += pulseSpeed;
    //if (!timer) {
    //  startTime = millis();
    //  timer = true;
    //} else {
    //  lightRadius = 0;
    //  timer = false;
    //}
    //if (timer && millis() - startTime >= duration) {
    //  lightRadius = 0;
    //  timer = false;
    //}
  }
  
  void deselect() {
    if (isSelected) {
      isSelected = false;
    }
  }


}
