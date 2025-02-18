public class Solution01 {
  // time O(n) space O(n)
  // I know a way with only one for, but still the same big O
  public static int FindElementWithHighestFrequency(int[] elements) 
  {    
    int highestFrequencyElement = -1;
    int maxFrequency = 0;
    var elementFrequency = new Dictionary<int, int>();

    for (int i = 0; i < elements.Length; i++)
    {
        var element = elements[i];
        if (elementFrequency.ContainsKey(element))
        {
            elementFrequency[element]++;
        }
        else
        {
            elementFrequency.Add(element, 1);
        }
    }

    foreach (var element in elementFrequency)
    {
        if (element.Value > maxFrequency)
        {
            maxFrequency = element.Value;
            highestFrequencyElement = element.Key;
        }
    }

    return highestFrequencyElement;
  }

  public static void Setup()
  {
    Console.WriteLine("Element: " + FindElementWithHighestFrequency(new int[]{1,1,1,3,3,2,2,2}));
  }
}