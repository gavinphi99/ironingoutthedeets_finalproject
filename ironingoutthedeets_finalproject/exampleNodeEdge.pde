//ArrayList<Node> nodes = new ArrayList<Node>();
//ArrayList<Edge> edges = new ArrayList<Edge>();

//void setup() {
//  size(500, 500);
//  // Add nodes to the arraylist
//  nodes.add(new Node(50, 50));
//  nodes.add(new Node(100, 100));
//  nodes.add(new Node(200, 200));
//  nodes.add(new Node(250, 250));
  
//  // Add edges to the arraylist
//  edges.add(new Edge(nodes.get(0), nodes.get(1)));
//  edges.add(new Edge(nodes.get(1), nodes.get(2)));
//  edges.add(new Edge(nodes.get(2), nodes.get(3)));
//}

//void draw() {
//  background(255);
  
//  // Draw edges
//  stroke(0);
//  for (Edge e : edges) {
//    line(e.start.x, e.start.y, e.end.x, e.end.y);
//  }
  
//  // Draw nodes
//  for (Node n : nodes) {
//    n.display();
//  }
//}

//// Node class
//class Node {
//  float x, y;
  
//  Node(float x_, float y_) {
//    x = x_;
//    y = y_;
//  }
  
//  void display() {
//    fill(255);
//    stroke(0);
//    ellipse(x, y, 20, 20);
//  }
//}

//// Edge class
//class Edge {
//  Node start, end;
  
//  Edge(Node start_, Node end_) {
//    start = start_;
//    end = end_;
//  }
//}
