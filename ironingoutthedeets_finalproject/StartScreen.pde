Graph graph;

class StartScreen {
  
  String[] lines;
  
  StartScreen(String[] lines) {
    this.lines = lines;
    
  }
  
  void fill_graph() {
    int num_nodes = parseInt(this.lines[0]);
    for (int i = 1; i <= num_nodes; i++) {
      graph.add_vertex(new Node(this.lines[i], i, width/2, height/2, 50);
      node
    }
  }
}
