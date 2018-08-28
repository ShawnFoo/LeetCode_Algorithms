import Foundation

/**
 59. Spiral Matrix II
 
 Tags: Array
 
 https://leetcode.com/problems/spiral-matrix-ii/description/
 */

/**
 8ms实现. 时间复杂度O(n^2), 空间复杂度:O(1)
 
 思路: 与顺时针遍历矩阵类似. 共四个方向进行遍历, 向右、向下、向左、向上
 
 主要注意判断4个边界位置(右上、右下、左下、左上), 每个边界位置需变换一次方向, 然后收缩刚遍历过的边界即可
 */
class Solution {
    private enum Direction {
        case toRight, toBottom, toLeft, toTop
    }
    
    func generateMatrix(_ n: Int) -> [[Int]] {
        if n <= 0 {
            return []
        }
        var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
        var left = 0
        var right = n - 1
        var top = 0
        var bottom = n - 1
        var index = 1
        let count = n * n
        var direction: Direction = .toRight
        var x = 0
        var y = 0
        while index <= count {
            matrix[y][x] = index
            switch direction {
            case .toRight:
                if x == right { // 到边界, 换方向, 收缩边界
                    direction = .toBottom
                    y += 1
                    top = y
                } else {
                    x += 1
                }
            case .toBottom:
                if y == bottom {
                    direction = .toLeft
                    x -= 1
                    right = x
                } else {
                    y += 1
                }
            case .toLeft:
                if x == left {
                    direction = .toTop
                    y -= 1
                    bottom = y
                } else {
                    x -= 1
                }
            case .toTop:
                if y == top {
                    direction = .toRight
                    x += 1
                    left = x
                } else {
                    y -= 1
                }
            }
            index += 1
        }
        return matrix
    }
}

Solution().generateMatrix(3)
