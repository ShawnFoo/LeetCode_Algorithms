import Foundation

/**
 118. Pascal's Triangle
 
 Tags: Array
 
 https://leetcode.com/problems/pascals-triangle/description/
 */

/**
 8ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 0 {
            return []
        }
        var result: [[Int]] = []
        var row: [Int] = []
        for column in 1...numRows {
            let lastRow = result.last ?? []
            let mid = (column - 1) / 2
            for j in 0..<column {
                if j == 0 { // 起始为1
                    row.append(1)
                } else if j <= mid { // 等于上边两个之和
                    row.append(lastRow[j] + lastRow[j - 1])
                } else { // 中轴对称赋值
                    row.append(row[column - 1 - j])
                }
            }
            result.append(row)
            row.removeAll()
        }
        return result
    }
}
