class Node_new{
  
  float x, y, r;
  color c;
  boolean drag;
  boolean timer = false;
  float startTime, lightRadius;
  float pulseSpeed = 0.3;
  float duration = 1000;
  
  Node_new(float x, float y, float r, color c){
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
  }
  
  void createNode(){
    
   noStroke();
   // displayed circle
   fill(c);
   ellipse(x, y, (r + lightRadius), (r + lightRadius));
   // add text to where the value shows on it
   
   // pulsating light
   fill(168, 218, 220);
   ellipse(x, y, r, r); 
  }
  
  boolean isMouseOver(){
    return dist(mouseX, mouseY, x, y) < r;
  }
  
  void startDrag(){
    drag = true;
  }
  
  void stopDrag(){
    drag = false;
  }
  
  void updatePosition(){
    if (drag){
      x = mouseX;
      y = mouseY;
    }
  }
   
   void drawLines(Node[] nodes){
     strokeWeight(1);
     stroke(0);
     for (Node other : nodes){
       if (other != this){
         line(x, y, other.x, other.y);
       }
     }
   }
   
   void pulse(){
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
  
  
}
