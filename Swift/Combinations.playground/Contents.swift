import Foundation

/**
 77. Combinations
 
 Tags:
 
 https://leetcode.com/problems/combinations/description/
 */

/**
 回溯实现. 68ms
 */
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        if n < k {
            return []
        }
        var combo: [Int] = []
        var results: [[Int]] = []
        for i in 1...n {
            backtracking(i, n, k, &combo, &results)
        }
        return results
    }
    
    private func backtracking(_ begin: Int, _ end: Int, _ limit: Int, _ combo: inout [Int], _ results: inout [[Int]]) {
        let remains = end - begin + 1
        if combo.count + remains >= limit {
            combo.append(begin)
            if combo.count == limit {
                results.append(combo)
            } else {
                for i in 1..<remains {
                    backtracking(begin + i, end, limit, &combo, &results)
                }
            }
            combo.removeLast()
        }
    }
}

Solution().combine(4, 3)
