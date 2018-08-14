/**
 Letter Combinations of a Phone Number
 
 Tags: String、 Backtracking
 
 https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/
 */

/**
 回溯实现(8ms). 每生成1种组合后, 回到上一步尝试其他字母. 反复至所有情况生成
 */
class Solution {
    private static let keyValues: [[String]] = [
        [],
        [],
        ["a", "b", "c"],
        ["d", "e", "f"],
        ["g", "h", "i"],
        ["j", "k", "l"],
        ["m", "n", "o"],
        ["p", "q", "r", "s"],
        ["t", "u", "v"],
        ["w", "x", "y", "z"]
    ]

    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return Array<String>()
        }
        var results: [String] = []
        _letterCombinations("", 0, Array(digits), &results)
        return results
    }

    private func _letterCombinations(_ comb: String, _ index: Int, _ digits: [Character], _ results: inout [String]) {
        if index >= digits.count {
            results.append(comb)
        } else {
            let keyIndex = Int(String(digits[index]))!
            let values = Solution.keyValues[keyIndex]
            for value in values {
                _letterCombinations(comb + value, index + 1, digits, &results)
            }
        }
    }
}

/**
 排列组合实现(8ms). 每次把遍历前一次的所有组合, 去生成新的组合记录下来. 反复至全部遍历完
 
 第1次 [a, b, c]
 第二次 [ad, ae, af, bd, be, bf, cd, ce, cf]
 第三次 [adg, aeg, afg, adh ...]
 第n次  [..]
 */
class Solution2 {
    private static let keyValues: [[String]] = [
        [],
        [],
        ["a", "b", "c"],
        ["d", "e", "f"],
        ["g", "h", "i"],
        ["j", "k", "l"],
        ["m", "n", "o"],
        ["p", "q", "r", "s"],
        ["t", "u", "v"],
        ["w", "x", "y", "z"]
    ]
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return Array<String>()
        }
        var results: [String] = []
        for digitChar in digits {
            let keyIndex = Int(String(digitChar))!
            let keyValues = Solution2.keyValues[keyIndex]
            var tempResults: [String] = []
            if results.count == 0 {
                tempResults = keyValues
            } else {
                for comb in results {
                    for keyValue in keyValues {
                        tempResults.append(comb + keyValue)
                    }
                }
            }
            results = tempResults
        }
        return results
    }
}

Solution().letterCombinations("23")
Solution2().letterCombinations("23")

