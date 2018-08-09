import Foundation

/**
 基于动态规划公式的递归 + Hash Table备忘. 12ms

 时间复杂度: O(n). 空间复杂度: O(n)
 
 思路: 因为每个点只有两种路径选择, 所以从终点来看, 可以推导总路径数 F(m, n) = F(m-1, n) + F(m, n-1) 之和
 */
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 {
            return 0
        }
        var memo: [Int: Int] = [:]
        return _uniquePaths(&memo, m - 1, n - 1)
    }
    
    private func _uniquePaths(_ memo: inout [Int: Int], _ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 { // 终止条件为横轴或纵轴靠边了, 此时只能走直线, 也就是说这条路径已经确定了, 无需继续遍历下去
            return 1
        } else {
            let key = _memoHashKey(m, n)
            if memo[key] == nil { // 根据推导公式 F(m, n) = F(m-1, n) + F(m, n-1)
                memo[key] = _uniquePaths(&memo, m - 1, n) + _uniquePaths(&memo, m, n - 1)
            }
            return memo[key]!
        }
    }
    
    private func _memoHashKey(_ m: Int, _ n: Int) -> Int {
        return m + n * 100 // 题目说最多100*100. 故此处*100就不会hash冲突
    }
}

/// 暴力回溯递归实现. 超时. 时间复杂度: O(n^2), 空间复杂度: O(n)
class SolutionBacktracking {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 {
            return 0
        }
        var sum = 0
        _uniquePaths(&sum, m - 1, n - 1)
        return sum
    }
    
    /// 递归计算路线
    ///
    /// - Parameters:
    ///   - sum: 路线总数
    ///   - mSteps: 水平坐标可移动步数
    ///   - nSteps: 垂直坐标可移动步数
    private func _uniquePaths(_ sum: inout Int, _ mSteps: Int, _ nSteps: Int) {
        if mSteps == 0 && nSteps == 0 {
            sum += 1
        } else if mSteps == 0 {
            _uniquePaths(&sum, 0, nSteps - 1)
        } else if nSteps == 0 {
            _uniquePaths(&sum, mSteps - 1, 0)
        } else { // 除非靠边, 否则每个点可以往右移或往下移
            _uniquePaths(&sum, mSteps - 1, nSteps)
            _uniquePaths(&sum, mSteps, nSteps - 1)
        }
    }
}

Solution().uniquePaths(3, 2)
Solution().uniquePaths(7, 3)
Solution().uniquePaths(23, 12)
