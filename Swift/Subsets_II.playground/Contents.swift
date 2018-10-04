import Foundation

/**
 90. Subsets II
 
 Tags: Array、Backtracking
 
 https://leetcode.com/problems/subsets-ii/description/
 */

/**
 回溯实现, 16ms.
 */
class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        var combo: [Int] = []
        var results = [[Int]]()
        backtracking(0, sortedNums, &combo, &results)
        return results
    }
    
    private func backtracking(_ index: Int, _ nums: [Int], _ combo: inout [Int], _ results: inout [[Int]]) {
        results.append(combo)
        if index < nums.count {
            for i in index..<nums.count {
                if i > index // 确保每个位置组合一次
                    && nums[i - 1] == nums[i] { // 组合过的跳过
                    continue
                }
                combo.append(nums[i])
                backtracking(i + 1, nums, &combo, &results)
                combo.removeLast()
            }
        }
    }
}

Solution().subsetsWithDup([1,2,2])
