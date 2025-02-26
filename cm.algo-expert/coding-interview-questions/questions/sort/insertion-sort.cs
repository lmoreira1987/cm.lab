public class InsertionSortProblem {
  // time O(n^2) space O(1)
  public static int[] InsertionSort(int[] array) {
    int startIndex = 0;
    while(startIndex < array.Length) 
    {
        for (int i = startIndex; i > 0; i--)
            if (array[i-1] > array[i])
                swap(array, i);
        startIndex++;
    }
      
    return array;
  }

  public static void swap(int[] array, int index) {
      int temp = array[index];    
      array[index] = array[index-1];
      array[index-1] = temp;
  }
}