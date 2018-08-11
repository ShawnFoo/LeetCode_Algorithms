import Foundation

/**
 66. Plus One
 
 Tags: Array、Math
 
 https://leetcode.com/problems/plus-one/description/
 */

/**
 时间复杂度: O(n) ~= O(n + n/2), 空间复杂度: O(n). 12ms
 */
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result: [Int] = []
        var addOne = true
        var i = digits.count - 1
        while i >= 0 {
            var value = digits[i]
            if addOne {
                value += 1
                addOne = value > 9
                value = addOne ? value - 10 : value
            }
            result.append(value)
            i -= 1
        }
        if addOne {
            result.append(1)
        }
        // 倒叙一次
        let mid = (result.count - 1) / 2
        i = 0
        while i <= mid {
            let match = result.count - 1 - i
            let matchValue = result[match]
            result[match] = result[i]
            result[i] = matchValue
            i += 1
        }
        return result
    }
}

Solution().plusOne([1,2,3])
Solution().plusOne([6,1,4,5,3,9,0,1,9,5,1,8,6,7,0,5,5,4,3])
