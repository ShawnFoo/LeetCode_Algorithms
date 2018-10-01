import Foundation

/**
 77. Combinations
 
 Tags: Backtracking
 
 https://leetcode.com/problems/combinations/description/
 */

/**
 常规回溯实现. 56ms
 */
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        if n < k {
            return []
        }
        var combo: [Int] = []
        var results: [[Int]] = []
        backtracking(1, n, k, &combo, &results)
        return results
    }
    
    private func backtracking(_ begin: Int, _ end: Int, _ limit: Int, _ combo: inout [Int], _ results: inout [[Int]]) {
        print(combo)
        if combo.count == limit {
            results.append(combo)
        } else if combo.count + end - begin + 1 >= limit { // 剩下若达不到限制的组合数量就没必要尝试了
            for i in begin...end {
                combo.append(i)
                backtracking(i + 1, end, limit, &combo, &results)
                combo.removeLast()
            }
        }
    }
}

Solution().combine(4, 3)
