import Foundation

/**
 53. Maximum Subarray
 
 Tags: Array、Divide and Conquer、Dynamic Programming
 
 https://leetcode.com/problems/maximum-subarray/description/
 */

/**
 Kadane算法(按贪心算法去理解), 时间复杂度O(n), 空间复杂度O(1)

 求连续数字组成和最大的子数组, 求连续的局部最优解, 遍历下来最大的局部之和即为最终结果
 */
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var curSum = nums[0] // 局部最大连续组合值
        var maxSum = nums[0] // 全局最大连续组合值
        for i in 1..<nums.count {
            curSum = max(nums[i], nums[i] + curSum) // 若加上当前数(主要是负数)导致和还小于当前数, 则取当前值
            maxSum = max(maxSum, curSum) // 更新全局最优解
        }
        return maxSum
    }
}

/**
 动态规划, 时间复杂度O(n), 空间复杂度O(1)
 
 把大问题分解为求包含第n个元素的局部连续序列和, 然后求出包含各个位置元素的子序列和. 取最大的一个即为结果.
 
 包含第n个元素的最大和公式为 Sum(n) = max(0, Sum(n-1)) + nums[n]
 
 Sum(n-1)小于0, 即为负数, 则加上只会更小, 所以取当前nums[n]重新开始
 */
class SolutionDP {
    func maxSubArray(_ nums: [Int]) -> Int {
        if !nums.isEmpty {
            var sumWithN = nums.first! // 包含第N个元素的连续组合值
            var maxSum = sumWithN // 全局最大连续组合值
            for i in 1..<nums.count {
                sumWithN = max(0, sumWithN) + nums[i]
                maxSum = max(maxSum, sumWithN)
            }
            return maxSum
        }
        return 0
    }
}

/**
 分治法实现, 类似merge sort, 分+合
 
 将整个范围不断划分为小的子区间至最小单位1个元素, 然后将子区间不断合并(通过相邻子区间的中点), 求得合并下来后最大的子区间
 
 可以肯定的是, 和最大的子序列必定在 0~n-1 范围内. 通过分治, 可以确定子序列一定会位于划分后子区间的以下范围内
 
 left ~ mid-1 | mid+1 ~ right | left + right (mid位于left~right)
 */
class SolutionDC {
    func maxSubArray(_ nums: [Int]) -> Int {
        return _maxSubArray(nums, 0, nums.count - 1)
    }
    
    private func _maxSubArray(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        if left == right {
            return nums[left]
        } else if left > right {
            return Int.min
        }
        let mid = (left + right) / 2
        let leftMax = _maxSubArray(nums, left, mid - 1)
        let rightMax = _maxSubArray(nums, mid + 1, right)
        
        var mLeftMax = 0 // 包含mid位置的左侧最大和
        var mRightMax = 0 // 包含mid位置的右侧最大和
        var sum = 0
        var i = mid - 1
        while i >= left { // 从mid-1起至left区间内的最大子序列和
            sum += nums[i]
            mLeftMax = max(mLeftMax, sum)
            i -= 1
        }
        i = mid + 1
        sum = 0
        while i <= right { // 从mid+1至right区间内的最大子序列和
            sum += nums[i]
            mRightMax = max(mRightMax, sum)
            i += 1
        }
        // 最大子数组和必定坐落 left~mid-1 或 mid+1~right 或 left~right横跨中点mid(即必定包含nums[mid]
        return max(max(leftMax, rightMax), mLeftMax + mRightMax + nums[mid])
    }
}

//Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
SolutionDP().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
//SolutionDC().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
