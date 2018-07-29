import Foundation

/**
 36、Valid Sudoku
 
 Tags: Hash Table
 
 https://leetcode.com/problems/valid-sudoku/description/
 
 思路: 把大区域划分成9个(3x3)的子区域遍历, 识别子区域合法的同时, 判断所在行列是否出现重复数字
 
 列|行 0   1   2
 0    0 | 1 | 2
 1    3 | 4 | 5
 2    6 | 7 | 8
 
 */

/**
 时间复杂度: O(1). 比下方Solution1(同时间复杂度)使用hash table跑出来的runtime时间要短, 应该是生成key的操作导致的
 
 使用数组来存储按位操作后的数值. 按位与若大于0则说明存在重复数.
 
 注释可参考Solution1, 只是空间存储不一样
 */
class Solution {
    private static let dotChar = Character(".")
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        // 以下数组都存储 按位或后的数值 1<<0 | 1<<1
        var rowsBits: [Int] = Array(repeating: 0, count: 9) // 各行
        var columnsBits: [Int] = Array(repeating: 0, count: 9) // 各列
        var boxBits = 0 // 小区域快
        var boxIndex = 0
        while boxIndex < 9 {
            let columnBoxIndex = boxIndex % 3
            let rowBoxIndex = boxIndex / 3
            for row in 0..<3 {
                let rIndex = rowBoxIndex * 3 + row
                for column in 0..<3 {
                    let cIndex = columnBoxIndex * 3 + column
                    let value = board[rIndex][cIndex]
                    if value == Solution.dotChar {
                        continue
                    }
                    if exists(of: value, with: &boxBits)
                        || exists(of: value, with: &(rowsBits[rIndex]))
                        || exists(of: value, with: &(columnsBits[cIndex])) {
                        return false
                    }
                }
            }
            boxBits = 0
            boxIndex += 1
        }
        return true
    }
    
    private func exists(of value: Character, with bits: inout Int) -> Bool {
        let bitValue = 1 << Int(String(value))!
        if bitValue & bits == 0 {
            bits += bitValue
            return false
        }
        return true
    }
}

/**
 时间复杂度: O(1)
 
 使用一个hash table进行记录, key规范为两种形式:
 1. 完整区域的行列Key, 分别记为c_列数_1(column_数值), r_行_2(row_数值)
 2. 子区域Key, 记为 0~8 b_区域号_数值.
 */
class Solution1 {
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
                    if value != Solution1.dotChar {
                        // 分别生成完整区域的行、列Key以及子区域Key
                        let rowKey = String("r_\(rowBox * 3 + row)_\(value)")
                        let columnKey = String("c_\(columnBox * 3 + column)_\(value)")
                        let subBoxKey = String("b_\(subBoxIndex)_\(value)")
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
