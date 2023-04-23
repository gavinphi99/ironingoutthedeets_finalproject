class Stack{
  ArrayList<Node> stack;
  Stack(){
    this.stack = new ArrayList<Node>();
  }
  
  //add a node to the top of the stack
  void push(Node item){
    this.stack.add(item);
  }
  //remove an item from the top of the stack
  Node pop(){
    Node placeHolder = this.peek();
    this.stack.remove(stack.size() - 1);
    return placeHolder;
  }
  
  //check the item on the top of the stack
  Node peek(){
    return this.stack.get(stack.size() - 1);
  }

  //check if the stack if empty
  boolean is_empty(){
    return this.stack.size() == 0;
  }
  //return the number of elements in the stack
  int size(){
    return this.stack.size();
  }
}
