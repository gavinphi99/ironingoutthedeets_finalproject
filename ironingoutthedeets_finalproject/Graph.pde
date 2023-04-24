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

    vertices.add(new Vertex(label));

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

  ArrayList<Vertex> get_vertices() {
    return vertices;
  }
}
