class Data {
   
  Graph g;
  
  ArrayList<Node> nodes;
  
  String filename;
  String[] lines;
  
  int index;
  int num_nodes;
  
  boolean select;
  
  Data(String filename, ArrayList<Node> nodes) {
    lines = loadStrings(filename);
    
    g = new Graph(nodes);
    num_nodes = int(lines[0]);
    index = 0;
    select = false;
  }
  
  void fillGraph() {
    for (int i = 1; i <= num_nodes; i++) {
      g.add_vertex(new Node(lines[i]));
    }
    
    int num_edges = int(lines[num_nodes + 1]);
    
    for (int j = num_nodes + 2; j < (num_edges + num_nodes); j++) {
      String[] edges = lines[j].split(" ");
      //println(edges[0]);
      int start = int(edges[0]);
      int end = int(edges[1]);
      g.add_directed_edge(start, end, 1);
    }
    
  }
  
  void callDFS() {
    g.dfs(index);
  }
  
  void callBFS() {
    g.bfs(g.vertices.get(index));
  }
  
  void keyPressed() {
    if (keyCode == RIGHT) {
      if (index >= 0 && index < num_nodes) {
        index += 1;
      }
      else {
        index = 0;
      }
    }
    if (keyCode == LEFT) {
      if (index >= 0 && index < num_nodes) {
        index -= 1;
      }
      else {
        index = num_nodes - 1;
      }
    }
    if (key == ' ') {
      select = true;
    }
    else {
      select = false;
    }
  }
  
}
