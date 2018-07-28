import Foundation

/**
 36、Valid Sudoku
 
 Tags: Hash Table
 
 https://leetcode.com/problems/valid-sudoku/description/
 */

/**
 思路: 大区域划分成9个(3x3)的子区域遍历, 识别子区域合法的同时, 判断所在行列是否出现重复数字
 
 行  0   1   2
 列
 0   0 | 1 | 2
 1   3 | 4 | 5
 2   6 | 7 | 8
 
 使用一个hash table进行记录, key规范为两种形式:
 1. 完整区域的行列Key, 分别记为c_列数_1(column_数值), r_行_2(row_数值)
 2. 子区域Key, 记为 0~8 b_区域号_数值.
 */
class Solution {
    private static let dotChar = Character(".")
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var hashTable: [String: Bool] = [:]
        var subBoxIndex = 0
        while subBoxIndex < 9 {
            let columnBox = subBoxIndex % 3  // 大行号 0~2
            let rowBox = subBoxIndex / 3     // 大列号 0~2
            // 3x3子区域遍历. 0~8依次检查
            for column in 0..<3 {
                let cIndex = columnBox * 3 + column // 9x9列号
                for row in 0..<3 { // 9x9行号
                    let rIndex = rowBox * 3 + row // 9x9行号
                    let value = board[rIndex][cIndex]
                    if value != Solution.dotChar {
                        // 分别生成完整区域的行、列Key以及子区域Key
                        let rowKey = "r_\(rowBox * 3 + row)_\(value)"
                        let columnKey = "c_\(columnBox * 3 + column)_\(value)"
                        let subBoxKey = "b_\(subBoxIndex)_\(value)"
                        if checkExistence(of: rowKey, in: &hashTable)
                        || checkExistence(of: columnKey, in: &hashTable)
                        || checkExistence(of: subBoxKey, in: &hashTable) {
                            return false
                        }
                    }
                }
            }
            subBoxIndex += 1
        }
        return true
    }
    
    /// 检查key是否有对应value, 如果有则返回true. 否则设置key的值并返回false
    private func checkExistence(of key: String, in table: inout [String: Bool]) -> Bool {
        if table[key] == nil {
            table[key] = true
            return false
        }
        return true
    }
}

Solution().isValidSudoku([["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]])
