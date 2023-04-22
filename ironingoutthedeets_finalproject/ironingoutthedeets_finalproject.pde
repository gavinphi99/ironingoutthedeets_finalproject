import drop.*;

SDrop drop;

void setup() {
  size(400, 400);
  drop = new SDrop(this);
}

void draw() {
  background(0);
}


void dropEvent(DropEvent theDropEvent) {
  if(theDropEvent.isFile()) {
    File myFile = theDropEvent.file();
    println("\nisDirectory ? "+myFile.isDirectory()+"  /  isFile ? "+myFile.isFile());
  }
}
