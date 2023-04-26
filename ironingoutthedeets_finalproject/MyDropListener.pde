class MyDropListener extends DropListener {
  
  int myColor;
  
  MyDropListener() {
    myColor = color(255);
    // set a target rect for drop event.
    setTargetRect(10,10,100,100);
  }
  
  void draw() {
    fill(myColor);
    rect(10,10,100,100);
  }
  
  // if a dragged object enters the target area.
  // dropEnter is called.
  void dropEnter() {
    myColor = color(255,0,0);
  }
  
  // if a dragged object leaves the target area.
  // dropLeave is called.
  void dropLeave() {
    myColor = color(255);
  }
  
  void dropEvent(DropEvent theEvent) {
    println("Dropped on MyDropListener");
  }
}
