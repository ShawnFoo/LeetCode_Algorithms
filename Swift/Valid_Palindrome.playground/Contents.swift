import Foundation

/**
 125. Valid Palindrome
 
 Tags: Two Pointers、String
 
 https://leetcode.com/problems/valid-palindrome/description/
 */

/**
 双指针实现, 32ms. 时间复杂度O(n), 空间复杂度O(1)
 */
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        if s.count <= 1 {
            return true
        }
        
        let chars = Array(s.utf8)
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
    
    private func lowercaseCharacter(_ char: UInt8) -> UInt8 {
        return isUpperCaseCharacter(char) ? char + 32 : char
    }
    
    private func isAlphanumericCharacter(_ char: UInt8) -> Bool {
        // http://www.tamasoft.co.jp/en/general-info/unicode.html
        return isDigitCharacter(char)
        || isUpperCaseCharacter(char)
        || isLowerCaseCharacter(char)
    }
    
    private func isDigitCharacter(_ char: UInt8) -> Bool {
        return 0x30 <= char && char <= 0x39
    }
    
    private func isUpperCaseCharacter(_ char: UInt8) -> Bool {
        return 0x41 <= char && char <= 0x5a
    }
    
    private func isLowerCaseCharacter(_ char: UInt8) -> Bool {
        return 0x61 <= char && char <= 0x7a
    }
}

Solution().isPalindrome("A man, a plan, a canal: Panama")

