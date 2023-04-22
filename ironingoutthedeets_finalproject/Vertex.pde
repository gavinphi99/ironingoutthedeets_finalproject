class Vertex {
  String label;
  boolean visited;

  Vertex(String label) {
    this.label = label;
    visited = false;
  }

  boolean was_visited() {
    return visited;
  }

  String get_label() {
    return label;
  }
  /*
  String toString() {
    return str(label);
  }
  */
}
