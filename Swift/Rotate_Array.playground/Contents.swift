import Foundation

/**
 189. Rotate Array
 
 Tags:
 
 https://leetcode.com/problems/rotate-array/description/
 */

/**
 借助了临时数组实现, 68ms. 时间复杂度O(n), 空间复杂度O(k%nums.count)
 */
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.count <= 1 || nums.count == k {
            return
        }
        
        let shift = k % nums.count // 偏移量取余, 过滤多余操作
        let numsK = Array(nums[nums.count - shift..<nums.count])
        for i in (0..<nums.count - shift).reversed() { // 后移
            nums[i+shift] = nums[i]
        }
        for i in 0..<shift { // prefix赋值
            nums[i] = numsK[i]
        }
    }
}


var nums = [-1, 2]
Solution().rotate(&nums, 3)
