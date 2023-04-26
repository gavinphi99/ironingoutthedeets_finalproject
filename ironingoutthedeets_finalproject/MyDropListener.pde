class MyDropListener extends DropListener {

  int myColor;

  MyDropListener() {
    setTargetRect(w.fileDrop.x, w.fileDrop.y, w.fileDrop.w, w.fileDrop.h);
  }

  // this isn't working
  void draw() {
    fill(myColor);
    rect(w.fileDrop.x, w.fileDrop.y, w.fileDrop.w, w.fileDrop.h);
  }

  // if a dragged object enters the target area.
  // dropEnter is called.

  // this isn't working
  void dropEnter() {
    myColor = color(#AACB9C);
  }

  // if a dragged object leaves the target area.
  // dropLeave is called.

  // this isn't working
  void dropLeave() {
    myColor = color(200);
  }

  void dropEvent(DropEvent theDropEvent) {
    if (theDropEvent.isFile()) {
      File myFile = theDropEvent.file();
      filename = myFile.getName();
      w.fileDropped();
      
    }
  }

  void mouseClicked() {
    data.fillGraph(filename);
    println(graph.vertices);
  }
}
