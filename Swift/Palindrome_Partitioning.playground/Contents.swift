import Foundation

/**
 131. Palindrome Partitioning
 
 Tags: Backtracking
 
 https://leetcode.com/problems/palindrome-partitioning/description/
 */

/**
 回溯实现, 64ms
 */
class Solution {
    func partition(_ s: String) -> [[String]] {
        guard s.count > 0 else {
            return []
        }
        let chars = Array(s)
        var combo: [String] = []
        var combos: [[String]] = []
        backtracking(0, 0, chars, &combo, &combos)
        return combos
    }
    
    private func backtracking(_ begin: Int,
                              _ length: Int,
                              _ chars: [Character],
                              _ combo: inout [String],
                              _ combos: inout [[String]]) {
        for i in begin..<chars.count {
            let length = i - begin
            if isPalindrome(begin, length, chars) {
                combo.append(String(chars[begin...begin+length]))
                if i == chars.count - 1 {
                    combos.append(combo)
                } else {
                    backtracking(i + 1, 0, chars, &combo, &combos)
                }
                combo.removeLast()
            }
        }
    }
    
    private func isPalindrome(_ begin: Int,
                              _ length: Int,
                              _ chars: [Character]) -> Bool {
        guard chars.count > 0 && begin + length < chars.count else {
            return false
        }
        var front = begin
        var end = begin + length
        while front <= end {
            if chars[front] == chars[end] {
                front += 1
                end -= 1
            } else {
                return false
            }
        }
        return true
    }
}

Solution().partition("aab")
Solution().partition("cdd")
