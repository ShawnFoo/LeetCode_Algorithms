import Foundation

/**
 136. Single Number
 
 https://leetcode.com/problems/single-number/description/
 */

/**
 异或实现, 92ms. 时间复杂度O(n), 空间复杂度O(1)
 
 思路: 异或操作同位相同为0, 不同为1
 */
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
}
