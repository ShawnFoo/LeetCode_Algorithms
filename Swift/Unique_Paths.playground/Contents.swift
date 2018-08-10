import Foundation

/**
 62. Unique Paths
 
 Tags: Array、Dynamic Programming
 
 https://leetcode.com/problems/unique-paths/description/
 */

/**
 递归 + Hash Table备忘. 12ms

 时间复杂度: O(n). 空间复杂度: O(n)
 
 思路: 因为每个点只有两种路径选择, 所以从终点来看, 可以推导总路径数
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

/**
 动态规划. 时间复杂度O(n). 空间复杂度O(n). 12ms

 思路: 基于前边递归算法实现推导出的公式: F(m, n) = F(m-1, n) + F(m, n-1) 走到某个位置的路径数 = 上边位置的路径数 + 左边位置的路径数
 
 将多个维度拆分成1个维度的动态规划问题, 一行一行de去处理. 第一行以及第一列上的点只能走直线到达, 故这些点的路径数统统为1
 */
class SolutionDP {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 {
            return 0
        }
        var memo: [Int: Int] = [1: 1]
        // 直接从第二行, 第二列开始. 跳过固定路径的格子m+n个
        var row = 2
        while row <= n {
            var column = 2
            while column <= m {
                let key = _memoHashKey(column, row)
                memo[key] = memo[_memoHashKey(column - 1, row)]! + memo[_memoHashKey(column, row - 1)]!
                column += 1
            }
            row += 1
        }
        return memo[_memoHashKey(m, n)]!
    }
    
    private func _memoHashKey(_ m: Int, _ n: Int) -> Int {
        if m == 1 || n == 1 {
            return 1 // 第一行或第一列的点全部都只有1种路径走法, 共用1个key
        }
        return m + n * 100
    }
}

/// 暴力回溯递归实现. 超时. 时间复杂度: O(2^n), 空间复杂度: O(n)
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

//Solution().uniquePaths(3, 2)
//Solution().uniquePaths(7, 3)
//Solution().uniquePaths(23, 12)
SolutionDP().uniquePaths(3, 3)
