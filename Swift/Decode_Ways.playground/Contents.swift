import Foundation

/**
 91. Decode Ways
 
 Tags: String、DP
 
 https://leetcode.com/problems/decode-ways/description/
 */

/**
 DP实现, 12ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class Solution {
    func numDecodings(_ s: String) -> Int {
        let chars = Array(s)
        if chars.count == 0 || chars[0] == "0" {
            return 0
        }
        
        var ways: [Int] = Array(repeating: 0, count: chars.count + 1)
        ways[0] = 1
        ways[1] = chars[0] == "0" ? 0 : 1
        if chars.count > 1 {
            for i in 2...chars.count {
                let curNum = charToInt(chars[i-1])
                let value = ways[i]
                if isValidNum(curNum) {
                    ways[i] += ways[i-1]
                }
                let prevNum = charToInt(chars[i-2])
                if isValidCombo(prevNum, curNum) {
                    ways[i] += ways[i-2]
                }
                if value == ways[i] {
                    return 0
                }
            }
        }
        return ways[chars.count]
    }
    
    private func charToInt(_ char: Character) -> UInt32 {
        return char.unicodeScalars.first!.value - Unicode.Scalar("0")!.value
    }
    
    private func isValidNum(_ num: UInt32) -> Bool {
        return num > 0
    }
    
    private func isValidCombo(_ high: UInt32, _ low: UInt32) -> Bool {
        let value = high * 10 + low
        return value > 9 && value < 27
    }
}

/**
 回溯暴力实现, Time Limit.
 */
class SolutionBackTracking {
    func numDecodings(_ s: String) -> Int {
        var count = 0
        var combo: [Character] = []
        backtracking(0, Array(s), &count, &combo)
        return count
    }
    
    private func backtracking(_ index: Int, _ chars: [Character], _ count: inout Int, _ combo: inout [Character]) {
        if combo.count == chars.count {
            count += 1
        } else {
            for begin in index..<chars.count {
                if matchOneChar(begin, chars) {
                    combo.append(chars[begin])
                    backtracking(begin + 1, chars, &count, &combo)
                    combo.removeLast()
                }
                if matchTwoChars(begin, chars) {
                    combo.append(chars[begin])
                    combo.append(chars[begin + 1])
                    backtracking(begin + 2, chars, &count, &combo)
                    combo.removeLast()
                    combo.removeLast()
                }
            }
        }
    }
    
    private func matchOneChar(_ index: Int, _ chars: [Character]) -> Bool {
        if index < chars.count {
            let charInt = charToInt(chars[index])
            return charInt > 0 && charInt < 10
        }
        return false
    }
    
    private func matchTwoChars(_ index: Int, _ chars: [Character]) -> Bool {
        if index + 1 < chars.count {
            let value = charToInt(chars[index]) * 10 + charToInt(chars[index + 1])
            return value > 9 && value < 27
        }
        return false
    }
    
    private func charToInt(_ char: Character) -> UInt32 {
        return char.unicodeScalars.first!.value - Unicode.Scalar("0")!.value
    }
}

Solution().numDecodings("12")
Solution().numDecodings("0")
