import drop.*;


Node n1;
SDrop drop;

void setup() {
  size(400, 400);
  n1 = new Node("Test", 0, width/2, height/2, 50);
  drop = new SDrop(this);
}

void draw() {
  background (255);
  n1.createNode();
  n1.dragNode();
}


void dropEvent(DropEvent theDropEvent) {
  if (theDropEvent.isFile()) {
    File myFile = theDropEvent.file();
    println("\nisDirectory ? "+myFile.isDirectory()+"  /  isFile ? "+myFile.isFile());
  }
}
