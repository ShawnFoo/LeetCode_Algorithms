import Foundation

/**
 54. Spiral Matrix
 
 Tags: Array
 
 https://leetcode.com/problems/spiral-matrix/description/
 */

/**
 8ms实现, 时间复杂度O(mn), 空间复杂度O(1)
 
 思路: 题目要求的是顺时针旋转遍历, 即4个遍历方向, 向右、向下、向左、向上
 
 主要注意判断4个边界位置(右上、右下、左下、左上), 每个边界位置需变换一次方向, 然后收缩刚遍历过的边界即可
 */
class Solution {
    private enum Direction {
        case toRight, toBottom, toLeft, toTop
    }
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result: [Int] = []
        if matrix.count > 0 && matrix.first!.count > 0 {
            let count = matrix.count * matrix.first!.count
            var index = 0
            var left = 0
            var right = matrix.first!.count - 1
            var top = 0
            var bottom = matrix.count - 1
            
            var x = 0
            var y = 0
            var direction: Solution.Direction = .toRight // 默认向右
            while index < count {
                result.append(matrix[y][x]) // 逆时针修改为[x][y]即可
                // 移动过程中边界收缩、方向纠正
                switch direction {
                case .toRight:
                    if x == right { // 触边界, 换向
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
        }
        return result
    }
}

Solution().spiralOrder([[1,2,3],[4,5,6],[7,8,9]])
