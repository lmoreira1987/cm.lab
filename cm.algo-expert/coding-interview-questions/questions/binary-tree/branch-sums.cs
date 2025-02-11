public class Tree {
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

  // O(n) time | O(n) space
  public static List<int> BranchSums(BinaryTree root) {
    var sums = new List<int>();    
    BranchSumsCalculate(root, sums, 0);
    return sums;
  }

  public static void BranchSumsCalculate(BinaryTree node, List<int> sums, int sum) {
    if (node == null) return;

    int runningSum = sum + node.value;
    if (node.left == null && node.right == null)
    {
        sums.Add(runningSum);
        return;
    }

    BranchSumsCalculate(node.left, sums, runningSum);
    BranchSumsCalculate(node.right, sums, runningSum);
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
    root.left.right.left = new BinaryTree(10);

    // Expected Result: [15, 16, 18, 10, 11]
    List<int> result = BranchSums(root);
    Console.WriteLine("Branch Sums: " + string.Join(", ", result));
  }
}