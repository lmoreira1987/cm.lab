using System;

public class GreenTwoNumberSum {
  public static int[] TwoNumberSum(int[] array, int targetSum) {
    
    for (int i = 0; i < array.Length; i++)
    {
      for (int j = array.Length - 1; i+1 <= j ; j--)
      {
        if (array[i] + array[j] == targetSum)
        {
          return [array[i], array[j]];
        }
        // Console.WriteLine(i + " - " + j);
      }  
    }

    return new int[0];
  }
}