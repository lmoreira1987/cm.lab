public class TreeND {
  // O(n) time | O(n) space
  public static int NodeDepths(BinaryTree root) {    
    return CalculateNodeDepth(root, 0, 0);
  }

  public static int CalculateNodeDepth(BinaryTree node, int sum, int depth) {
    if (node == null) return sum;

    int runningSum = sum + depth;
    if (node.left == null && node.right == null)
    {
        return runningSum;
    }

    depth++;
    runningSum = CalculateNodeDepth(node.left, runningSum, depth);
    runningSum = CalculateNodeDepth(node.right, runningSum, depth);

    return runningSum;
  }

  public static void Setup() {    
    BinaryTree root = new BinaryTree(1);
    root.left = new BinaryTree(2);
    root.right = new BinaryTree(3);
    root.left.left = new BinaryTree(4);
    root.left.right = new BinaryTree(5);
    root.right.left = new BinaryTree(6);
    root.right.right = new BinaryTree(7);
    root.left.left.left = new BinaryTree(8);
    root.left.left.right = new BinaryTree(9);

    // Expected Result: 16
    Console.WriteLine("Node Depth: " + NodeDepths(root));
  }
}