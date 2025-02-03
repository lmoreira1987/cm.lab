using System;
using System.Collections;

public class GreenTwoNumberSum {
  
  // O(n^2) time | O(1) space
  public static int[] TwoNumberSum(int[] array, int targetSum) {
    
    for (int i = 0; i < array.Length; i++)
    {
      for (int j = array.Length - 1; i+1 <= j ; j--)
      {
        if (array[i] + array[j] == targetSum)
        {
          return new int[] { array[i], array[j] };
        }
      }  
    }

    return new int[0];
  }

  // O(n) time | O(n) space because we are putting values in a hashtable/dictionary
  public static int[] TwoNumberSumWithHashtable(int[] array, int targetSum) {
    // var nums = new Hashtable();
    var nums = new Dictionary<int, bool>(); // Better performance in C# than a hashtable

    foreach (var num in array)
    {
      var potencialMatch = targetSum - num;
      if (nums.ContainsKey(potencialMatch))
      {
        return new int[] {potencialMatch, num};
      }
      else
      {
        nums.Add(num, true);
      }
    }

    return new int[0];
  }
}