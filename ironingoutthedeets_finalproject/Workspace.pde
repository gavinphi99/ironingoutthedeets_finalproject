class Workspace {

  int start;
  int work;
  int dropped;
  int bfsPress;
  int dfsPress;
  Button upload;
  Button bfs;
  Button dfs;
  FileDrop fileDrop;
  Field viz;

  Workspace(ArrayList<Node> nodes) {
    start = 1;
    work = 0;
    dropped = 0;
    bfsPress = 0;
    dfsPress = 0;

    upload = new Button(50, height/2 - 70, 50, 50);
    upload.content = "Upload Adjacency Matrix";
    upload.style(darks[0], lights[1]);
    upload.hoverStyle(accents[0], darks[1]);

    bfs = new Button(width/5, 50, 50, 50);
    bfs.content = "Run BFS";
    bfs.style(darks[0], lights[1]);
    bfs.hoverStyle(accents[0], darks[1]);

    dfs = new Button(width/5, 110, 50, 50);
    dfs.content = "Run DFS";
    dfs.style(darks[0], lights[1]);
    dfs.hoverStyle(accents[0], darks[1]);

    fileDrop = new FileDrop(50, height/2, width - 100, height/2);
    fileDrop.style(darks[0], lights[1]);
    fileDrop.hoverStyle(accents[1], accents[0]);

    viz = new Field(width/3, 50, width - width/3 - 50, height - 100);
    viz.style(darks[0], lights[1]);
    viz.hoverStyle(accents[1], accents[0]);
  }

  void startScreen() {
    if (start == 1) {

      fill(darks[1]);
      rect(0, 0, width, height);
      fileDrop.drop(mouseX, mouseY);
      fileDrop.display();
      //rect(50, height/2, width - 100, height/2, 20);
      upload.hover(mouseX, mouseY);
      upload.display();
    }
  }

  void startWork() {
    start = 0;
    work = 1;
  }

  void work() {
    if (work == 1) {
      fill(darks[1]);
      noStroke();
      rect(0, 0, width, height);
      viz.drop(mouseX, mouseY);
      viz.display();
      bfs.hover(mouseX, mouseY);
      dfs.hover(mouseX, mouseY);
      bfs.display();
      dfs.display();
      visualize(nodes);
    }
  }
  
  void visualize(ArrayList<Node> nodes) {
    for (int i = 0; i < nodes.size(); i++) {
      nodes.get(i).updatePosition();
      nodes.get(i).pulse();
      nodes.get(i).drawLines(nodes);
      nodes.get(i).createNode();
    }
  }

  void fileDropped() {
    dropped = 1;
  }

  void bfsPressed() {
    dfsPress = 0;
    bfsPress = 1;
  }

  void dfsPressed() {
    bfsPress = 0;
    dfsPress = 1;
  }

  Boolean hasUploaded() {
    // will be used to verify file upload
    if (dropped == 1) {
      return true;
    } else {
      return false;
    }
  }

  Boolean hasBFSPressed() {
    if (bfsPress == 1) {
      return true;
    } else {
      return false;
    }
  }

  Boolean hasDFSPressed() {
    if (dfsPress == 1) {
      return true;
    } else {
      return false;
    }
  }

  void mouseClicked() {
    if (w.upload.intersect(mouseX, mouseY) && w.hasUploaded()) {
      w.startWork();
      m.mouseClicked();
      //println(w.start);
      //println(w.work);
      //println("here");
    }

    if (w.bfs.intersect(mouseX, mouseY) && w.hasBFSPressed()) {
    }
  }
}
