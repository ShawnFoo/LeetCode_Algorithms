import Foundation

/**
 40. Combination Sum II
 
 Tags: Array、Backtracking
 
 https://leetcode.com/problems/combination-sum-ii/description/
 */

/**
 回溯实现.
 
 思路: 与Combination Sum类似, 理解题意要求即可. andidates中的数字仅能用1次; 结果集合中不能有重复结果.
 */
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var results: [[Int]] = []
        var combo: [Int] = []
        backtracking(&combo, 0, candidates.sorted(), target, &results)
        return results
    }
    
    private func backtracking(_ combo: inout [Int], _ fromIndex: Int, _ candidates: [Int], _ target: Int, _ results: inout [[Int]]) {
        if target == 0 {
            results.append(combo)
        } else if target > 0 {
            var index = fromIndex
            while index < candidates.count {
                let value = candidates[index]
                combo.append(value)
                backtracking(&combo, index + 1, candidates, target - value, &results)
                combo.removeLast()
                // 相同数字再次回溯的结果属于上一次回溯的子集, 故直接跳过去重
                while index < candidates.count - 1
                    && candidates[index] == candidates[index + 1] {
                    index += 1
                }
                index += 1
            }
        }
    }
}
