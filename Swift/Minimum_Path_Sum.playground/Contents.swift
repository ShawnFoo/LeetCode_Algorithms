import Foundation

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

let arr = [[7,1,3,5,8,9,9,2,1,9,0,8,3,1,6,6,9,5],[9,5,9,4,0,4,8,8,9,5,7,3,6,6,6,9,1,6],[8,2,9,1,3,1,9,7,2,5,3,1,2,4,8,2,8,8],[6,7,9,8,4,8,3,0,4,0,9,6,6,0,0,5,1,4],[7,1,3,1,8,8,3,1,2,1,5,0,2,1,9,1,1,4],[9,5,4,3,5,6,1,3,6,4,9,7,0,8,0,3,9,9],[1,4,2,5,8,7,7,0,0,7,1,2,1,2,7,7,7,4],[3,9,7,9,5,8,9,5,6,9,8,8,0,1,4,2,8,2],[1,5,2,2,2,5,6,3,9,3,1,7,9,6,8,6,8,3],[5,7,8,3,8,8,3,9,9,8,1,9,2,5,4,7,7,7],[2,3,2,4,8,5,1,7,2,9,5,2,4,2,9,2,8,7],[0,1,6,1,1,0,0,6,5,4,3,4,3,7,9,6,1,9]]
SolutionBacktrcking().minPathSum(arr)
