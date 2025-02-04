using System;

public class GreenBubbleSort {
  public static int[] BubbleSort(int[] array) {
    
    for (int i = 0; i < array.Length; i++)
    {
        var temp = i+1;
        for (int j = 0; j < array.Length - (i+1); j++, temp++)
        {
            if (array[i] > array[temp])
            {
                swap(array, i, temp);
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