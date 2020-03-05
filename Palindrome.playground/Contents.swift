import UIKit

func checkPalindrome(_ word: String) -> Bool {
    var palindrome = ""
    for char in word.reversed(){
        palindrome.append(char)
    }
    return palindrome == word
}

checkPalindrome("ba")
