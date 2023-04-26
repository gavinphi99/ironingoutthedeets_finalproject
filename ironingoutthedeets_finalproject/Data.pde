class Data {
  
  String[] lines;
  
  int index;
  
  int selectNode = 0;
  
  boolean select;
  int num_nodes;
  
  Data() {
    index = 0;
    select = false;
  }
  
  void fillGraph(String filename) {
    lines = loadStrings(filename);
    num_nodes = int(lines[0]);
    
    for (int i = 1; i <= num_nodes; i++) {
      
      graph.add_vertex(new Node(lines[i], 0, random(width), random(height), 50, #C6DAE6));
    }
    
    int num_edges = int(lines[num_nodes + 1]);
    
    for (int j = num_nodes + 2; j < (num_edges + num_nodes + 2); j++) {
      String[] edgesInput = lines[j].split(" ");
      //println(edges[0]);
      int start = int(edgesInput[0]);
      int end = int(edgesInput[1]);
      //println(j);
      //graph.add_directed_edge(start, end, 1);
      edges.add(new Edge(nodes.get(start), nodes.get(end)));
      
    }
    //println(edges);
  }
  
  void callDFS() {
    graph.dfs(index);
  }
  
  void callBFS() {
    graph.bfs(graph.vertices.get(index));
  }
  
  void keyPressed() {
    
    //if (keyCode == RIGHT && selectNode > 0) {
    //  selectNode++;
    //  graph.vertices.get(selectNode).keyPulse();
      
    //}
    //else if (keyCode == LEFT && selectNode < num_nodes) {
    //  selectNode++;
    //  graph.vertices.get(selectNode).keyPulse();
    //}
    //else if (key == ' ') {
    //  graph.vertices.get(index).keyPulse();
    //}
  }
  
}
