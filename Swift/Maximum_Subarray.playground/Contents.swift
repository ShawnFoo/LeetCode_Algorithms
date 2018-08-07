import Foundation

/**
 53. Maximum Subarray
 
 Tags: Array、Divide and Conquer、Dynamic Programming
 
 https://leetcode.com/problems/maximum-subarray/description/
 */

/**
 时间复杂度: O(n)
 
 思路: 贪心算法. 求连续数字组成和最大的子数组, 即求连续的局部最优解, 遍历下来最大的局部之和即为最终结果
 */
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var curSum = nums[0] // 局部连续子序列和
        var maxSum = nums[0] // 全局遍历中的最大和
        for i in 1..<nums.count {
            curSum = max(nums[i], nums[i] + curSum) // 若加上当前数(负数)导致和小于当前数, 则取当前值
            maxSum = max(maxSum, curSum) // 不断更新局部最优解
        }
        return maxSum
    }
}


Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
