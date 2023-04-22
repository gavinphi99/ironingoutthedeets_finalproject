class Node{
  float x,y,r;
  Node(float x, float y, float r){
    this.x = x;
    this.y = y;
    this.r = r;
  }
  
  
  void createNode(){
   noStroke();
   fill(173, 202, 214);
   ellipse(x, y, r, r); 
  }
  
  void dragNode(){
    if (dist(mouseX, mouseY, x, y) < r) {
     if (mousePressed){
       x = mouseX;
       y = mouseY;

     }
    }
  }
}
