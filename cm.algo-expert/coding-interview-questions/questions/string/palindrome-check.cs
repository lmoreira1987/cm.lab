public class PalindromeCheck {
  // time O(n) space O(1)
  public static bool IsPalindrome(string str) {
    var pointer = str.Length -1;
    var length = str.Length % 2 != 0 ? str.Length : str.Length / 2;
    
    for (int i = 0; i < length; i++, pointer--)
    {       
        // Console.WriteLine("i:" + i + " p:" + pointer);    
        if (str[i] != str[pointer]) return false;
        if (i == pointer) break;             
    }

    return true;
  }
}