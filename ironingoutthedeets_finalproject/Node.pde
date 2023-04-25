class Node{
  float x,y,r;
  String label;
  int index;
  boolean visited;
  boolean overlap;
  Node(String label, int index, float x, float y, float r){
    this.x = x;
    this.y = y;
    this.r = r;
    this.label = label;
    this.visited = false;
    this.index = index;
  }
  
  Node(String label){
    this.label = label;
    this.visited = false;
    x = width / 2;
    height = height / 2;
    r = 50;
    index = 0;
  }
  
  int getIndex(){
    return this.index;
  }
  
  void set_visited(boolean bool){
    this.visited = bool;
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
  
  boolean overlap(Node other){
    float distBtwCenters = dist(x, y, other.x, other.y);
    return distBtwCenters <= r + other.r;
  }
}
