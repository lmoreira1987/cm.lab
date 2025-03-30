public class BinarySearchProblem {
  // time O(log n) space O(1)
  public static int BinarySearch(int[] array, int target) {         
    int left = 0;
    int right = array.Length - 1;
    
    while (left <= right) 
    {
        int middle = (int)((left + right) / 2);
        int potentialMatch = array[middle];
        
        if (potentialMatch == target) 
            return middle;   
        else if (potentialMatch > target)
            right = middle - 1;
        else
            left = middle + 1;
    }
      
    return -1;
  }
}