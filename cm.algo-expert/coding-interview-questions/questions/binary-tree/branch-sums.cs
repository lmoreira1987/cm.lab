using System;
using System.Collections.Generic;

public class Tree {
  // This is the class of the input root. Do not edit it.
  public class BinaryTree {
    public int value;
    public BinaryTree left;
    public BinaryTree right;

    public BinaryTree(int value) {
      this.value = value;
      this.left = null;
      this.right = null;
    }
  }

  public static List<int> BranchSums(BinaryTree root) {
    var bs = new List<int>();
    
    BranchSumsCalculate(root, bs, 0);

    return bs;
  }

  // O(n) time | O(n) space
  public static void BranchSumsCalculate(BinaryTree node, List<int> bs, int sum) {
    if (node == null) return;

    int runningSum = sum + node.value;
    if (node.left == null && node.right == null)
    {
        bs.Add(runningSum);
        return;
    }

    BranchSumsCalculate(node.left, bs, runningSum);
    BranchSumsCalculate(node.right, bs, runningSum);
  }

  public static void Setup() {
    // Criando uma árvore binária de exemplo
    BinaryTree root = new BinaryTree(1);
    root.left = new BinaryTree(2);
    root.right = new BinaryTree(3);
    root.left.left = new BinaryTree(4);
    root.left.right = new BinaryTree(5);
    root.right.left = new BinaryTree(6);
    root.right.right = new BinaryTree(7);
    root.left.left.left = new BinaryTree(8);
    root.left.left.right = new BinaryTree(9);
    root.left.right.left = new BinaryTree(10);

    // Saída esperada: [15, 16, 18, 10, 11]
    List<int> result = BranchSums(root);
    Console.WriteLine("Branch Sums: " + string.Join(", ", result));
  }
}