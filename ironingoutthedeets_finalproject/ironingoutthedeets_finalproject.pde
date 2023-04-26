import drop.*;
//put at top with global variables
import processing.sound.*;
//download the minim library from processing

boolean isMuted;
SoundFile arrows, searchSelect;

//Button b1;
Workspace w;
SDrop drop;
MyDropListener m;
Data data;
Graph graph;

//Node[] nodes ={
//  // this will be whatever the user inputs
//  new Node("A", 0, width/2, height/2, 50, #C6DAE6),
//  new Node("B", 1, 100, 100, 50,#C6DAE6),
//};

ArrayList <Node> nodes;
ArrayList <Edge> edges;
int numNodes;


//ArrayList<Node> nodes;

String filename;

PFont h1;
PFont h2;
PFont body;
PFont hover;

color[] accents = {#90D8BE, #587E70};
color[] lights = {#E8E8E8, #DEDEDE};
color[] meds = {#ADADAD, #868686};
color[] darks = {#676767, #434343};

float startX;
float startY;

void setup() {
  size(1500, 700);
  nodes = new ArrayList<>();
  edges = new ArrayList<>();

  isMuted = false;
  arrows = new SoundFile(this, "179017smartwentcodysoft-keystroke.wav");
  searchSelect = new SoundFile(this, "571512legitcheesesoft-notifications-bell-highding.mp3");
  //nodes.add(new Node("A", 0, width/2, height/2, 50, #C6DAE6));
  //nodes.add(new Node("B", 1, 100, 100, 50, #C6DAE6));
  //nodes.add(new Node("C", 1, 200, 200, 50, #C6DAE6));
  //nodes.add(new Node("A"));
  //nodes.add(new Node("B"));
  //body = loadFont("IBMPlexMono-Text.otf");
  //hover = loadFont("IBMPlexMono-TextItalic.otf");

  w = new Workspace(nodes);

  //b1 = new Button(width, height/2, 50, 50);
  //b1.content = "Run BFS";
  //b1.style(darks[0], lights[1]);
  //b1.hoverStyle(accents[0], darks[1]);

  drop = new SDrop(this);
  graph = new Graph(nodes);
  data = new Data();
  m = new MyDropListener();
  drop.addDropListener(m);
  background(darks[0]);
}

void draw() {
  int count = 0;

  //for (Node node : nodes) {
  //  node.updatePosition();
  //  node.pulse();
  //}

  //for (Node node : nodes) {
  //  node.drawLines(nodes);
  //  node.createNode();
  //}

  //fill(0);
  //rect(0, 0, width, height);
  //noStroke();
  //fill(lights[1]);
  //b1.hover(mouseX,mouseY);
  //b1.display();

  //n1.createNode();
  //n1.dragNode();

  //n2.createNode();
  //n2.dragNode();

  //overlaps();


  //if (w.hasUploaded()) {


  //}

  w.startScreen();
  w.work();

  fill(0);
  stroke(10);

  for (Edge e : edges) {
    //println(count);
    //println(e);
    //println(e.n1.x);
    //println(e.n2.x);
    e.updateEdge();
    count++;
  }
  for (int i = 0; i < nodes.size(); i++) {
    if (i == selectNode) {
      nodes.get(i).keyPulse();
    }
  }



  //println(w.start);
}

//void overlaps(){
//  boolean notOverlapping = !n1.overlap(n2);
//  if (notOverlapping) {
//    println("The circles are not overlapping");
//  } else {
//    println("The circles are overlapping");
//  }
//}

void mouseClicked() {
  if (w.upload.intersect(mouseX, mouseY) && w.hasUploaded()) {
    w.startWork();
    m.mouseClicked();
    numNodes = data.num_nodes;

    //println(w.start);
    //println(w.work);
    //println("here");
  }

  if (w.bfs.intersect(mouseX, mouseY) && w.hasBFSPressed()) {
  }

  if (w.dfs.intersect(mouseX, mouseY) && w.hasDFSPressed()) {
  }
}

Node current;

void mousePressed() {
  for (Node node : nodes) {
    if (node.isMouseOver()) {
      current = node;
      startX = node.x;
      startY = node.y;
      node.startDrag();
    }
  }
}

void replaceNode() {
  for (int i = 0; i < nodes.size(); i++) {
    if (nodes.get(i).label.equals(current.label)) {
      nodes.set(i, current);
    }
  }
}
void mouseReleased() {
  for (Node node : nodes) {
    if (!current.overlap(nodes)) {
      current.x = startX;
      current.y = startY;
      replaceNode();
    }
    node.stopDrag();
  }
}
int selectNode = 0;

void keyPressed() {
  //m key changes if the sound is muted
  if (key == 'm' || key == 'M') {
    isMuted = !isMuted;
  }
  if (!isMuted) {
    if (key == LEFT || key == RIGHT) {
      arrows.play();
    }
    if (key == 'd' || key == 'D' || key == 'b' || key == 'B') {
      searchSelect.play();
    }
  }


  if (keyCode == RIGHT && selectNode > 0) {
    selectNode++;
    nodes.get(selectNode).keyPulse();
  } else if (keyCode == LEFT && selectNode < numNodes - 1) {
    selectNode++;
    nodes.get(selectNode).keyPulse();
  } else if (key == ' ') {
    nodes.get(numNodes).keyPulse();
  }
  //data.keyPressed();
}


//void mousePressed() {
//  for (int i = 0; i < numNodes; i++) {
//    float x = width/2 + r * cos(i * angle);
//    float y = height/2 + r * sin(i * angle);
//    if (dist(mouseX, mouseY, x, y) < 10) {
//      dragging = true;
//      offsetX = x - mouseX;
//      offsetY = y - mouseY;
//      break;
//    }
//  }
//}

//void mouseDragged() {
//  if (dragging) {
//    int i = (int) ((atan2(mouseY - height/2, mouseX - width/2) + angle/2) / angle);
//    float x = mouseX + offsetX;
//    float y = mouseY + offsetY;
//    ellipse(x, y, 20, 20);
//  }
//}

//void mouseReleased() {
//  dragging = false;
//}

//void keyPressed() {
//  data.keyPressed();
//}

void dropEvent(DropEvent theDropEvent) {
}
