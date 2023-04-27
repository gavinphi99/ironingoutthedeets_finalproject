class Data {

  String[] lines;

  int index;

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
    println(num_edges + num_nodes + 2);
    for (int j = num_nodes + 2; j < (num_edges + num_nodes + 2); j++) {
      String[] edgesInput = lines[j].split(" ");
      //println(edges[0]);
      int start = int(edgesInput[0]);
      int end = int(edgesInput[1]);
      //println(j);
      //graph.add_directed_edge(start, end, 1);
      edges.add(new Edge(nodes.get(start), nodes.get(end)));
      //println(edges);
    }
    //println(edges);
  }

  void saveCoord() {
    String[] coords = new String[num_nodes];
    for (int i = 0; i < num_nodes; i++) {
      coords[i] = str(nodes.get(i).x) + ", " + str(nodes.get(i).y);
    }
    saveStrings("output.txt", coords);
  }

  void callDFS() {
    graph.dfs(index);
  }

  void callBFS() {
    graph.bfs(graph.vertices.get(index));
  }

  void selectedPulse() {
    //println(index);
    for (int i = 0; i < num_nodes; i++) {
      if (i == index) {
        //println(nodes.get(i));
        nodes.get(i).select();
      }
      else {
        nodes.get(i).deselect();
      }
    }
  }
  
  void keyPressed() {
    //println(index);
    if (keyCode == RIGHT) {
      if (index >= 0 && index < num_nodes) {
        index++;
        
      } else {
        index = 0;
      }
    } else if (keyCode == LEFT) {
      if (index > 0 && index < num_nodes) {
        index--;
      } else {
        index = num_nodes - 1;
      }
    }
  }
}
