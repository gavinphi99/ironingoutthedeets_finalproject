class Graph {
  ArrayList<Node> vertices;
  int[][] adjMat;

  Graph() {
    vertices = new ArrayList<Node>();
    adjMat = new int[0][0];
  }

  boolean has_vertex(String label) {
    int nVert = vertices.size();
    for (int i = 0; i < nVert; i++) {
      if (label.equals(vertices.get(i).get_label())) {
        return true;
      }
    }
    return false;
  }

  int get_index(String label) {
    int nVert = vertices.size();
    for (int i = 0; i < nVert; i++) {
      if (label.equals(vertices.get(i).get_label())) {
        return i;
      }
    }
    return -1;
  }

  void add_vertex(String label) {
    if (has_vertex(label)) {
      return;
    }

    vertices.add(new Node(label));

    int nVert = vertices.size();
    int[][] newAdjMat = new int[nVert][nVert];
    for (int i = 0; i < nVert - 1; i++) {
      for (int j = 0; j < nVert - 1; j++) {
        newAdjMat[i][j] = adjMat[i][j];
      }
      newAdjMat[i][nVert - 1] = 0;
    }
    int[] newRow = new int[nVert];
    for (int i = 0; i < nVert; i++) {
      newRow[i] = 0;
    }
    newAdjMat[nVert - 1] = newRow;
    adjMat = newAdjMat;
  }

  void add_directed_edge(int start, int finish, int weight) {
    adjMat[start][finish] = weight;
  }

  void add_undirected_edge(int start, int finish, int weight) {
    adjMat[start][finish] = weight;
    adjMat[finish][start] = weight;
  }

  int get_edge_weight(String fromVertexLabel, String toVertexLabel) {
    int fromIndex = get_index(fromVertexLabel);
    int toIndex = get_index(toVertexLabel);
    int weight = adjMat[fromIndex][toIndex];
    if (weight != 0) {
      return weight;
    }
    return -1;
  }

  ArrayList<Integer> get_neighbors(int vertexIndex) {
    ArrayList<Integer> neighbors = new ArrayList<Integer>();
    int nVert = vertices.size();
    for (int i = 0; i < nVert; i++) {
      if (adjMat[vertexIndex][i] != 0) {
        neighbors.add(i);
      }
    }
    return neighbors;
  }

  int get_adj_unvisited_vertex(int v) {
    int nVert = vertices.size();
    for (int i = 0; i < nVert; i++) {
      if (adjMat[v][i] > 0 && !vertices.get(i).was_visited()) {
        return i;
      }
    }
    return -1;
  }

  ArrayList<Node> get_vertices() {
    return vertices;
  }

  // sets the visited flag to False for all nodes
  void reset_visited() {
    for (int i = 0; i <= vertices.size(); i++) {
      this.vertices.get(i).visited = false;
    }
  }

  void dfs(int start_index) {
    // reset visited status
    this.reset_visited();

    // create the Stack
    Stack theStack = new Stack();

    // mark the node as visited and push it on the Stack
    theStack.push (this.vertices.get(start_index));

    // visit all the other vertices according to depth
    while (!theStack.is_empty()) {

      // get an adjacent unvisited vertex
      int u = this.get_adj_unvisited_vertex(theStack.peek().getIndex());
        if (u == -1) {
        u = theStack.pop().getIndex();;
      } else {
        this.vertices.get(u).set_visited(true);
          theStack.push (this.vertices.get(u));
      }
    }
  }
}
