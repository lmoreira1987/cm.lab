using System;
using System.Collections.Generic;

public class DepthFirstSearchProgram {
  // Do not edit the class below except
  // for the DepthFirstSearch method.
  // Feel free to add new properties
  // and methods to the class.
  public class Node {
    public string name;
    public List<Node> children = new List<Node>();

    public Node(string name) {
      this.name = name;
    }

    // O(v+e) time | O(v) space
    public List<string> DepthFirstSearch(List<string> array) {
      array.Add(name);
      foreach(var child in children)
      {
          child.DepthFirstSearch(array);
      }
      return array;
    }

    public Node AddChild(string name) {
      Node child = new Node(name);
      children.Add(child);
      return this;
    }
  }
}