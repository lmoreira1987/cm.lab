public class FirstUniqueCharProblem {
  // time O(n) space O(n)
  public static int FirstUniqueChar(string s) {
    var arr = new int[26];
    for (int i = 0; i < s.Length; i++)
    {        
        var idx = s[i]-'a';
        arr[idx]++;        
    }

    for (int i = 0; i < s.Length; i++)
    {
        var idx = s[i]-'a';
        if (arr[idx] == 1) return i;
    }

    return -1;
  }
}