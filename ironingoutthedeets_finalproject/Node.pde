class Node{
  float x,y,r;
  String label;
  boolean visited;
  Node(String label, float x, float y, float r){
    this.x = x;
    this.y = y;
    this.r = r;
    this.label = label;
    this.visited = false;
  }

  boolean was_visited() {
    return visited;
  }

  String get_label() {
    return label;
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
