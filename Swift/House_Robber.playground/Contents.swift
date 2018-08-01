import Foundation

/**
 198. House Robber
 
 Tags: Dynamic Programming
 
 https://leetcode.com/problems/house-robber/description/
 */

/// 动态规划版, 时间复杂度O(n). 空间复杂度O(1). 然鹅跑起来Runtime是16ms, 递归版只要8ms. 
class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        } else if nums.count == 1 {
            return nums[0]
        } else {
            // 仅需记录前两次的最大结果保存即可
            var prevTwo = nums[0]   // 第n-2次
            var prevOne = max(nums[0], 0 + nums[1]) // 第n-1次
            for i in 2..<nums.count {
                let curTime = max(prevOne, prevTwo + nums[i]) // 第n个 = max(第n-1次, 第n-2次+第n个房屋的money)
                prevTwo = prevOne // n-1次变成了第n-2次
                prevOne = curTime // 当前这次抢夺的最大值赋给n-1次
            }
            return prevOne
        }
        return 0
    }
}

/**
 递归实现. 时间复杂度O(n). 空间复杂度O(n)
 
 由题意可以推断出:
 
 遍历到第n个房子的财产最大和 Sum(n) = max(Sum(n-1), Sum(n-2) + nums[n])
 */
class Solution1 {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        } else {
            var map: [Int: Int] = [:]
            return recursiveRob(nums.count - 1, nums, &map)
        }
    }

    private func recursiveRob(_ n: Int, _ nums: [Int], _ map: inout [Int: Int]) -> Int {
        if n == 0 {
            return nums[0]
        } else if n == 1 {
            return max(nums[0], nums[1])
        } else {
            if map[n] == nil {
                map[n] = max(recursiveRob(n - 1, nums, &map), recursiveRob(n - 2, nums, &map) + nums[n])
            }
            return map[n]!
        }
    }
}

Solution().rob([2,7,9,3,1])
Solution().rob([2,1,1,2])
