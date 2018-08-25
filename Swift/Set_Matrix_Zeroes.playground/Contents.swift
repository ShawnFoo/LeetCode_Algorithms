import Foundation

/**
 73. Set Matrix Zeroes
 
 Tags: Array
 
 https://leetcode.com/problems/set-matrix-zeroes/description/
 */

/**
 仅使用常量储存实现, 40ms. 时间复杂度(2mn+m+n), 空间复杂度O(1)
 
 相比于下边的Solution1(额外使用了两个数组去记录需要清零的行列号), 该实现借助矩阵中需要清零的某行及某列
 用来做清零行列号的记录, 避免m+n的空间占用
 */
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        if matrix.count > 0 && matrix.first!.count > 0 {
            var rowToRecZero = -1 // 记录列需要清0的行
            var columnToRecZero = -1 // 记录行需要清零的列
            for row in 0..<matrix.count {
                for column in 0..<matrix[row].count {
                    if matrix[row][column] == 0 {
                        // 先找到一个将要清零的行(列), 用于记录其他需要清零的行列
                        if rowToRecZero == -1 {
                            rowToRecZero = row
                        }
                        if columnToRecZero == -1 {
                            columnToRecZero = column
                        }
                        // 在记录行、列上对应位置记录要未来要清零的
                        matrix[rowToRecZero][column] = 0
                        matrix[row][columnToRecZero] = 0
                    }
                }
            }
            if rowToRecZero != -1 {
                // 使用记录行分别对其他行列进行清空
                for row in 0..<matrix.count {
                    if row != rowToRecZero && matrix[row][columnToRecZero] == 0 {
                        for column in 0..<matrix.first!.count {
                            matrix[row][column] = 0
                        }
                    }
                }
                for column in 0..<matrix.first!.count {
                    if column != columnToRecZero && matrix[rowToRecZero][column] == 0 {
                        for row in 0..<matrix.count {
                            matrix[row][column] = 0
                        }
                    }
                }
                // 最后清空记录用的行(列)
                for row in 0..<matrix.count {
                    matrix[row][columnToRecZero] = 0
                }
                for column in 0..<matrix.first!.count {
                    matrix[rowToRecZero][column] = 0
                }
            }
        }
    }
}

/**
 Hash Table实现, 36ms. 时间复杂度(2mn), 空间复杂度O(m+n)
 
 使用两个数组分别记录出现0过零的行列, 最后对应设置整行、整列为0
 */
class Solution1 {
    func setZeroes(_ matrix: inout [[Int]]) {
        if matrix.count > 0 && matrix.first!.count > 0 {
            var rowsToZero: [Bool] = Array(repeating: false, count: matrix.count)
            var columnsToZero: [Bool] = Array(repeating: false, count: matrix.first!.count)
            for row in 0..<matrix.count {
                let cNums = matrix[row]
                for column in 0..<cNums.count {
                    let value = cNums[column]
                    if value == 0 {
                        rowsToZero[row] = true
                        columnsToZero[column] = true
                    }
                }
            }
            for row in 0..<rowsToZero.count {
                if rowsToZero[row] {
                    for i in 0..<matrix[row].count {
                        matrix[row][i] = 0
                    }
                }
            }
            for column in 0..<columnsToZero.count {
                if columnsToZero[column] {
                    for row in 0..<matrix.count {
                        matrix[row][column] = 0
                    }
                }
            }
        }
    }
}

var matrix = [[1], [0]]
Solution().setZeroes(&matrix)

matrix = [[1,2,3,4],[5,0,5,2],[8,9,2,0],[5,7,2,1]]
Solution().setZeroes(&matrix)
