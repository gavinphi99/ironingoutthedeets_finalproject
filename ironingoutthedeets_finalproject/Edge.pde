class Edge {

  Node n1, n2;
  float thickness;

  Edge(Node n1, Node n2) {
    this.n1 = n1;
    this.n2 = n2;
    //this.thickness = thickness;
  }

  float getSlope() {
    return (this.n2.y - this.n1.y) / (this.n2.x - this.n1.x);
  }

  void updateEdge() {
    line(this.n1.x, this.n1.y, this.n2.x, this.n2.y);
  }
}
