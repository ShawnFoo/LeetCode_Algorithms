import Foundation

/**
 189. Rotate Array
 
 Tags: Array
 
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

/**
 反转实现, 52ms. 时间复杂度O(n), 空间复杂度O(1)
 */
class SolutionConstantSpace {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.count <= 1 || nums.count == k {
            return
        }
        
        let shift = k % nums.count
        // k计算出的分隔位置前后分别反转, 再全局反转即可
        reverse(&nums, 0, nums.count - shift - 1)
        reverse(&nums, nums.count - shift, nums.count - 1)
        reverse(&nums, 0, nums.count - 1)
    }
    
    private func reverse(_ nums: inout [Int], _ from: Int, _ to: Int) {
        var i = from, j = to
        while i < j {
            nums[i] ^= nums[j]
            nums[j] = nums[i] ^ nums[j]
            nums[i] = nums[i] ^ nums[j]
            
            i += 1
            j -= 1
        }
    }
}

var nums = [-1, 2]
Solution().rotate(&nums, 3)

var nums2 = [1,2,3,4,5,6,7]
SolutionConstantSpace().rotate(&nums2, 3)
