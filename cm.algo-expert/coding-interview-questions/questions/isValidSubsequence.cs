public class IsValidSubsequenceProblem {
  // space O(1) | time O(n)
  // public static bool IsValidSubsequence(List<int> array, List<int> sequence) {
  //   int pointer =  0;
  //   int subsequenceCounter = 0;
  //   int sequenceCount = sequence.Count;
  //   int arrayCount = array.Count;

  //   if (arrayCount < sequenceCount) 
  //     return false;

  //   for (int i = 0; i < sequenceCount; i++)
  //   {
  //     while(pointer < arrayCount) 
  //     {
  //       if (array[pointer] == sequence[i])
  //       {
  //         subsequenceCounter++;
  //         pointer++;
  //         break;
  //       }

  //       pointer++;
  //     }
  //   }

  //   return subsequenceCounter == sequenceCount;
  // }

  // space O(1) | time O(n)
  // With only one loop
  public static bool IsValidSubsequence(List<int> array, List<int> sequence) {
    int pointer =  0;
    int subsequenceCounter = 0;
    int sequenceCount = sequence.Count;
    int arrayCount = array.Count;

    while(pointer < arrayCount && subsequenceCounter < sequenceCount) 
    {        
      if (array[pointer] == sequence[subsequenceCounter])
      {
        subsequenceCounter++;
      }  
          
      pointer++;
    }    

    return subsequenceCounter == sequenceCount;
  }
}