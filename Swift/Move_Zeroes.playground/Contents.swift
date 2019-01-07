/**
 283. Move Zeroes
 
 Tags: Array、Two Pointers
 
 https://leetcode.com/problems/move-zeroes/description/
 */

import Foundation

/**
 In-place双指针实现, 52ms. 时间复杂度O(n), 空间复杂度O(1)
 */
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count <= 1 {
            return
        }
        var frontZeroIndex = -1
        var moreThanOneZero = false
        var index = 0
        while index < nums.count {
            if nums[index] != 0 && frontZeroIndex >= 0 {
                nums[frontZeroIndex] = nums[index]
                nums[index] = 0
                if moreThanOneZero {
                    frontZeroIndex += 1
                } else {
                    frontZeroIndex = index
                }
            } else if nums[index] == 0 {
                if frontZeroIndex < 0 {
                    frontZeroIndex = index
                } else {
                    moreThanOneZero = true
                }
            }
            index += 1
        }
    }
}

var nums = [1, 0, 3, 0, 0, 1, 2, 0, 5]
Solution().moveZeroes(&nums)
