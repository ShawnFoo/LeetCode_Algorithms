import Foundation

/**
 47. Permutations II
 
 Tags: Backtracking
 
 https://leetcode.com/problems/permutations-ii/description/
 */

/// 回溯实现
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var used: [Bool] = Array(repeating: false, count: nums.count)
        var combo: [Int] = []
        backtracking(&combo, &used, nums.sorted(), &results) // 数组排序一次方便跳过重复数字(重复数字会产生相同子集)
        return results
    }
    
    private func backtracking(_ combo: inout [Int], _ used: inout [Bool], _ nums: [Int], _ results: inout [[Int]]) {
        if combo.count == nums.count {
            results.append(combo)
        } else {
            var lastIndex = -1
            for i in 0..<nums.count {
                if used[i] // 用过的跳过
                    || lastIndex != -1 && nums[i] == nums[lastIndex] { // 重复的跳过
                    continue
                }
                used[i] = true
                combo.append(nums[i])
                backtracking(&combo, &used, nums, &results)
                used[i] = false
                combo.removeLast()
                lastIndex = i
            }
        }
    }
}

print("result: \(Solution().permuteUnique([1,1,2]))")
print("result: \(Solution().permuteUnique([2,2,1,1]))")
print("result: \(Solution().permuteUnique([0,1,0,0,9]))")
