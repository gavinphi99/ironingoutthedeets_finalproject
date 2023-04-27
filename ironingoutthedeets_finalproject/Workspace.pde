class Workspace {

  int start;
  int work;
  int dropped;
  int bfsPress;
  int dfsPress;
  int saveCoordPress;
  
  Button upload;
  Button bfs;
  Button dfs;
  Button saveCoord;
  FileDrop fileDrop;
  Field viz;
  float fx, fy, fw, fh;

  Workspace() {
    start = 1;
    work = 0;
    dropped = 0;
    bfsPress = 0;
    dfsPress = 0;
    saveCoordPress = 0;

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
    
    saveCoord = new Button(width/7, 170, 50, 50);
    saveCoord.content = "Save Coordinates";
    saveCoord.style(darks[0], lights[1]);
    saveCoord.hoverStyle(accents[0], darks[1]);

    fileDrop = new FileDrop(50, height/2, width - 100, height/2);
    fileDrop.style(darks[0], lights[1]);
    fileDrop.hoverStyle(accents[1], accents[0]);

    fx = width/3;
    fy = 50;
    fw = width - width/3 - 50;
    fh = height - 100;
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
    boolean vizStarted = false;
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
      if (!vizStarted){
        visualize(fx, fy, fw - 50, fh - 50, nodes);
        vizStarted = true;
      } else {
        updateViz(nodes);
      }
      
    }
  }
  
  void updateViz(ArrayList<Node> nodes) {
    for (int i = 0; i < nodes.size(); i++) {
      nodes.get(i).updatePosition();
      nodes.get(i).pulse();
      //nodes.get(i).drawLines(nodes);
      nodes.get(i).createNode();
    }
  }
  
  void visualize(float fx, float fy, float fw, float fh, ArrayList<Node> nodes){
    float size = nodes.size();
    int div = ceil(sqrt(size));
    int dimensionX = floor(fw) / div;
    int dimensionY = floor(fh) / div;
    int currentNode = 0;
    int rowCount = 0;
    for (int i = 0; i < div; i ++){
      rowCount = 0;
      for (int j = 0; j < div; j ++){
        if (currentNode <= (size - 1)){
          Node node = nodes.get(currentNode);
          node.x = fx + 50 + j*dimensionX;
          node.y = fy + 100 + i*dimensionY;
          if (rowCount%2!=0){
            node.y -= 50;
          }
          node.updatePosition();
          node.pulse();
          node.createNode();
          currentNode += 1;
          rowCount ++;
        }
      }
    }
  }

  void fileDropped() {
    dropped = 1;
  }

  void bfsPressed() {
    saveCoordPress = 0;
    dfsPress = 0;
    bfsPress = 1;
  }

  void dfsPressed() {
    saveCoordPress = 0;
    bfsPress = 0;
    dfsPress = 1;
  }
  
  void saveCoorPressed() {
    saveCoordPress = 1;
    dfsPress = 0;
    bfsPress = 0;
    
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
  
  Boolean hasSaveCoordPressed() {
    if (saveCoordPress == 1) {
      return true;
    }
    else {
      return false;
    }
  }

  //void mouseClicked() {
  //  if (w.upload.intersect(mouseX, mouseY) && w.hasUploaded()) {
  //    w.startWork();
  //    m.mouseClicked();
  //    //println(w.start);
  //    //println(w.work);
  //    //println("here");
  //  }
    
  //  else if (w.saveCoord.intersect(mouseX, mouseY)) {
  //    println("here1");
  //    data.saveCoord();
  //  }

    //if (w.bfs.intersect(mouseX, mouseY) && w.hasBFSPressed()) {
    //}
}
