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

class Queue{
  ArrayList<Node> queue;
  
  Queue(){
    this.queue = new ArrayList<Node>();
  }

  // add an item to the end of the queue
  void enqueue(Node item){
    this.queue.add(item);
  }

  // remove an item from the beginning of the queue
  Node dequeue(){
    Node placeHolder = this.peek();
    this.queue.remove(0);
    return placeHolder;
  }

  // checks the item at the top of the Queue
  Node peek(){
    return this.queue.get(0);
  }

  //check if the queue if empty
  boolean is_empty(){
    return this.queue.size() == 0;
  }
  //return the number of elements in the queue
  int size(){
    return this.queue.size();
  }
}
