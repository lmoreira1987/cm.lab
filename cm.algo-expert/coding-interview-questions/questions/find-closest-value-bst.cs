using System;

public class FindClosestValueInBstProgram {
  // Space O(1) | Time O(LogN)/O(n)
  public static int FindClosestValueInBst(BST tree, int target) {
    int closest = tree.value;
    BST currentNode = tree;

    while (currentNode != null) {
      if (Math.Abs(target - closest) > Math.Abs(currentNode.value - target)) {
        closest = currentNode.value;
      }

      if (target < currentNode.value) {
        currentNode = currentNode.left;
      } else if (target > currentNode.value) {
        currentNode = currentNode.right;
      } else {
        break;
      }
    }

    return closest;
  }

  public static void Setup() {
        // Criando a BST
        BST tree = new BST(10);
        tree.left = new BST(5);
        tree.left.left = new BST(2);
        tree.left.right = new BST(5);
        tree.left.left.left = new BST(1);
        
        tree.right = new BST(15);
        tree.right.left = new BST(13);
        tree.right.right = new BST(22);
        tree.right.left.right = new BST(14);

        // Testes com diferentes targets
        Console.WriteLine(FindClosestValueInBst(tree, 12)); // Deve retornar 13
        Console.WriteLine(FindClosestValueInBst(tree, 4));  // Deve retornar 5
        Console.WriteLine(FindClosestValueInBst(tree, 23)); // Deve retornar 22
        Console.WriteLine(FindClosestValueInBst(tree, 1));  // Deve retornar 1
        Console.WriteLine(FindClosestValueInBst(tree, 8));  // Deve retornar 10
    }

  public class BST {
    public int value;
    public BST left;
    public BST right;

    public BST(int value) {
      this.value = value;
    }
  }
}
