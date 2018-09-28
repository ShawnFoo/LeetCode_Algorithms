import Foundation

/**
 74. Search a 2D Matrix
 
 Tags: Array、Binary Search
 
 https://leetcode.com/problems/search-a-2d-matrix/description/
 */

/**
 一次二分查找实现, 16ms.
 
 假设N为矩阵中的元素数量, 时间复杂度O(logN), 空间复杂度O(1)
 */
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 || matrix.first!.count <= 0 {
            return false
        }
        // 边界判断
        if target < matrix.first!.first! || target > matrix.last!.last! {
            return false
        }
        // 因为矩阵的每行都有序, 可将矩阵看作"一个数组"进行二分查找
        var low = 0
        var high = matrix.count * matrix.first!.count - 1
        var mid = 0
        while low <= high {
            mid = (low + high) / 2
            // index转换为坐标
            let row = mid / matrix.first!.count
            let column = mid % matrix.first!.count
            let value = matrix[row][column]
            if value == target {
                return true
            } else if target < value {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return false
    }
}

/**
 两次二分查找实现, 20ms
 
 假设矩阵有N行, 每行M列, 时间复杂度O(logN + logM), 空间复杂度O(1)
 */
class SolutionBrute {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 || matrix.first!.count <= 0 {
            return false
        }
        // 边界判断
        if target < matrix.first!.first! || target > matrix.last!.last! {
            return false
        }
        // 二分查找确认行
        var rowLow = 0
        var rowHigh = matrix.count - 1
        var row = 0
        while rowLow <= rowHigh {
            row = (rowLow + rowHigh) / 2
            let rowMin = matrix[row].first!
            let rowMax = matrix[row].last!
            if target >= rowMin && target <= rowMax {
                break
            } else if target < rowMin {
                rowHigh = row - 1
            } else {
                rowLow = row + 1
            }
        }
        // 行中二分查找确定是否存在
        var low = 0
        var high = matrix[row].count - 1
        var mid = 0
        while low <= high {
            mid = (low + high) / 2
            let value = matrix[row][mid]
            if target == value {
                return true
            } else if target < value {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return false
    }
}
