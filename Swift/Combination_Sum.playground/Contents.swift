import Foundation

/**
 39. Combination Sum
 
 Tags: Array、Backtracking
 
 https://leetcode.com/problems/combination-sum/description/
 */

// 回溯实现
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var results: [[Int]] = []
        var combo: [Int] = []
        _combinationSum(&combo, 0, candidates, target, &results)
        return results
    }
    
    private func _combinationSum(_ combo: inout [Int], _ index: Int, _ candidates: [Int], _ target: Int, _ results: inout [[Int]]) {
        if target < 0 {
            return
        } else if target == 0 {
            results.append(combo)
        } else {
            for i in index..<candidates.count {
                let candidate = candidates[i]
                combo.append(candidate)
                _combinationSum(&combo, i, candidates, target - candidate, &results)
                combo.removeLast()
            }
        }
    }
}

Solution().combinationSum([2,3,6,7], 7)
Solution().combinationSum([2,3,5], 8)
