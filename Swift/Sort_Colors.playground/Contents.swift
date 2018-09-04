import Foundation

/**
 75. Sort Colors
 
 Tags: Array、Two Pointers、Sort
 
 https://leetcode.com/problems/sort-colors/description/
 */

/**
 双指针实现, 8ms. 时间复杂度O(n), 空间复杂度O(1)
 
 思路: 遍历数组, 将遇到的0、2分别往头尾坑位进行交换, 直至遍历完全数
 */
class Solution {
    func sortColors(_ nums: inout [Int]) {
        if nums.count <= 1 {
            return
        }
        var front = 0 // 替换0的坑位index
        var end = nums.count - 1 // 替换2的坑位index
        var i = 0
        while i <= end {
            if nums[i] == 0 && i != front {
                nums.swapAt(front, i)
                front += 1
            } else if nums[i] == 2 && i != end {
                nums.swapAt(i, end)
                end -= 1
            } else {
                i += 1
            }
        }
    }
}
