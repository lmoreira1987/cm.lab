public class TreeND {
  public class BinaryTreeND {
    public int value;
    public BinaryTreeND left;
    public BinaryTreeND right;

    public BinaryTreeND(int value) {
      this.value = value;
      left = null;
      right = null;
    }
  }

  // O(n) time | O(n) space
  public static int NodeDepths(BinaryTreeND root) {    
    return CalculateNodeDepth(root, 0, 0);
  }

  public static int CalculateNodeDepth(BinaryTreeND node, int sum, int depth) {
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
    BinaryTreeND root = new BinaryTreeND(1);
    root.left = new BinaryTreeND(2);
    root.right = new BinaryTreeND(3);
    root.left.left = new BinaryTreeND(4);
    root.left.right = new BinaryTreeND(5);
    root.right.left = new BinaryTreeND(6);
    root.right.right = new BinaryTreeND(7);
    root.left.left.left = new BinaryTreeND(8);
    root.left.left.right = new BinaryTreeND(9);

    // Expected Result: 16
    Console.WriteLine("Node Depth: " + NodeDepths(root));
  }
}