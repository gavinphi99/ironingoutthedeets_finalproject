Node[] nodes ={
  // this will be whatever the user inputs
  new Node(width/2, height/2, 50, #C6DAE6),
  new Node(100, 100, 50,#C6DAE6),
};


void setup(){
 size(500,500); 
}

void draw(){
 background(255);
 for (Node node : nodes){
   node.updatePosition();
   node.pulse();
 }
 
 for (Node node : nodes){
   node.drawLines(nodes);
   node.createNode();
 }

}

void mousePressed(){
  for (Node node : nodes){
    if (node.isMouseOver()){
      node.startDrag();
    }
  }
}

void mouseReleased(){
  for (Node node : nodes){
    node.stopDrag();
  }
}
