import Foundation

/**
 64. Minimum Path Sum

 Tags: Array、Dynamic Programming
 
 https://leetcode.com/problems/minimum-path-sum/description/
 */

/**
 DP优化版, 20ms. 时间复杂度O(m*n), 空间复杂度O(n)
 
 思路: 总体思路与下方SolutionDP一样, 只是在空间方面进行优化, 仅利用矩阵单行的空间进行推算, 该空间可以同时记录着上一行的结果以及本行推算的结果
 */
class SolutionDPImproved {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.count == 0 || grid.first!.count == 0 {
            return 0
        }
        var memo: [Int] = Array(repeating: Int.max, count: grid.first!.count)
        memo[0] = 0
        for y in 0..<grid.count {
            for x in 0..<grid.first!.count {
                let value = grid[y][x]
                if x == 0 { // 某行开头
                    memo[x] = value + memo[x] // 当前值+上个位置的结果
                } else {
                    memo[x] = value + min(memo[x], memo[x-1]) // memo[x]为当前位置上方的值
                }
            }
        }
        
        return memo.last!
    }
}

/**
 DP实现, 28ms. 时间复杂度O(mn), 空间复杂度O(mn)
 
 思路: 将多维问题拆解成一维, 一行一行的进行推导(因为某个位置的最小值只能由其上方位置以及左侧位置的值比较得出, 故该方案成立).
 
 公式 F(m, n) = min(F(m-1, n), F(m, n-1)) + grid[m][n]
 */
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.count == 0 || grid.first!.count == 0 {
            return 0
        }
        var memo: [[Int]] = Array(repeating: Array(repeating: 0, count: grid.first!.count), count: grid.count)
        for y in 0..<grid.count {
            for x in 0..<grid.first!.count {
                let value = grid[y][x]
                if x == 0 && y == 0 {
                    memo[y][x] = value
                } else if x == 0 { // 第一列, 仅由其上方位置值决定
                    memo[y][x] = value + memo[y-1][x]
                } else if y == 0 { // 第一行, 同理
                    memo[y][x] = value + memo[y][x-1]
                } else {
                    memo[y][x] = min(memo[y][x-1], memo[y-1][x]) + value
                }
            }
        }
        
        return memo.last!.last!
    }
}

/**
 递归+Memo实现, 32ms.
 
 思路: 由题目可推导出 F(m, n) = min(F(m-1, n), F(m, n-1)) + grid[m][n]
 */
class SolutionRecursive {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.count == 0 || grid.first!.count == 0 {
            return 0
        }
        var memo: [[Int]] = Array(repeating: Array(repeating: -1, count:grid.first!.count), count: grid.count)
        return recursive(grid.first!.count - 1, grid.count - 1, &memo, grid)
    }
    
    private func recursive(_ x: Int, _ y: Int, _ memo: inout [[Int]], _ grid: [[Int]]) -> Int {
        if y == 0 && x == 0 {
            return grid[y][x]
        } else {
            if memo[y][x] == -1 {
                let value = grid[y][x]
                var lastXSum = Int.max
                var lastYSum = Int.max
                if x - 1 >= 0 {
                    lastXSum = recursive(x - 1, y, &memo, grid)
                }
                if y - 1 >= 0 {
                    lastYSum = recursive(x, y - 1, &memo, grid)
                }
                memo[y][x] = value + min(lastXSum, lastYSum)
            }
            return memo[y][x]
        }
    }
}

/**
 暴力回溯实现. 毫无疑问超时. 时间复杂度 O(2^mn)
 */
class SolutionBacktrcking {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.count == 0 || grid.first!.count == 0 {
            return 0
        }
        var minSum = Int.max
        backtracking(0, 0, 0, &minSum, grid)
        return minSum
    }
    
    private func backtracking(_ x: Int, _ y: Int, _ sum: Int, _ minSum: inout Int, _ grid: [[Int]]) {
        let xEdge = grid.first!.count - 1
        let yEdge = grid.count - 1
        
        let toSum = sum + grid[y][x]
        if y == yEdge && x == xEdge {
            minSum = min(minSum, toSum)
        } else {
            if x != xEdge { // 右移
                backtracking(x + 1, y, toSum, &minSum, grid)
            }
            if y != yEdge { // 下移
                backtracking(x, y + 1, toSum, &minSum, grid)
            }
        }
    }
}

let arr = [[1,2,5],[3,2,1]]
SolutionRecursive().minPathSum(arr)
