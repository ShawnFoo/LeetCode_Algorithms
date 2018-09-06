import Foundation

/**
 递归+Memo实现
 
 思路: 由题目可推导出 F(m, n) = min(grid[m][n] + F(m-1, n), grid[m][n] + F(m, n-1))
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
                    lastXSum = value + recursive(x - 1, y, &memo, grid)
                }
                if y - 1 >= 0 {
                    lastYSum = value + recursive(x, y - 1, &memo, grid)
                }
                memo[y][x] = min(lastXSum, lastYSum)
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
