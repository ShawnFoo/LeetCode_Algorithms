import Foundation

/**
 198. House Robber
 
 Tags: Dynamic Programming
 
 https://leetcode.com/problems/house-robber/description/
 */


/**
 递归实现
 
 由题意可以推断出:
 
 遍历到第n个房子的财产最大和 Sum(n) = max(Sum(n-1), Sum(n-2) + nums[n])
 */
class Solution {
    func rob(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        return recursiveRob(nums.count - 1, nums, &map)
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
