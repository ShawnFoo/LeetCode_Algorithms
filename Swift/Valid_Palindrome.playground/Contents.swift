import Foundation

/**
 125. Valid Palindrome
 
 Tags: Two Pointers、String
 
 https://leetcode.com/problems/valid-palindrome/description/
 */

/**
 双指针实现, 80ms. 时间复杂度O(n), 空间复杂度O(1)
 */
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        if s.count <= 1 {
            return true
        }
        
        let chars = Array(s)
        var left = 0
        var right = chars.count - 1
        while left <= right {
            while left <= right && !isAlphanumericCharacter(chars[left]) {
                left += 1
            }
            while left <= right && !isAlphanumericCharacter(chars[right]) {
                right -= 1
            }
            if left <= right {
                if lowercaseCharacter(chars[left]) == lowercaseCharacter(chars[right]) {
                    left += 1
                    right -= 1
                } else {
                    return false
                }
            }
        }
        return true
    }
    
    private func lowercaseCharacter(_ char: Character) -> Character {
        return Character(String(char).lowercased())
    }
    
    private func isAlphanumericCharacter(_ char: Character) -> Bool {
        let charAscii = ascii(char)
        return ascii("a") <= charAscii && charAscii <= ascii("z")
        || ascii("A") <= charAscii && charAscii <= ascii("Z")
        || ascii("0") <= charAscii && charAscii <= ascii("9")
    }
    
    private func ascii(_ char: Character) -> UInt32 {
        return char.unicodeScalars.first!.value
    }
}
