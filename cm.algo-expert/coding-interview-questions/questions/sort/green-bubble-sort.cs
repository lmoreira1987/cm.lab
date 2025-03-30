using System;

public class GreenBubbleSort {
    // O(n²) no pior caso time | O(1) space
   public static int[] BubbleSort(int[] array) {
    for (int i = 0; i < array.Length - 1; i++)
    {
        for (int j = 0; j < array.Length - i - 1; j++)
        {
            if (array[j] > array[j + 1])
            {
                swap(array, j, j + 1);
            }
        }
    }
    return array;
  }

  private static void swap(int[] array, int i, int j)
  {
    var temp = array[j];
    array[j] = array[i];
    array[i] = temp;
  }
}