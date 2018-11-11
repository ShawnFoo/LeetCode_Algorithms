import Foundation

/**
 79. Word Search
 
 Tags: Array、Backtracking
 
 https://leetcode.com/problems/word-search/description/
 */

/**
 回溯实现, 612ms
 */
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.count == 0 || board.first!.count == 0 {
            return false
        }
        let wordChars = Array(word)
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: board.first!.count), count: board.count)
        // 从首字母匹配的位置开始搜索
        for y in 0..<board.count {
            for x in 0..<board.first!.count {
                if board[y][x] == wordChars.first!
                    && backtracking(board, &visited, y, x, 0, wordChars) {
                    return true
                }
            }
        }
        return false
    }
    
    private func backtracking(_ board: [[Character]],
                              _ visited: inout [[Bool]],
                              _ y: Int,
                              _ x: Int,
                              _ index: Int,
                              _ chars: [Character]) -> Bool {
        if index == chars.count {
            return true
        }
        if y < 0 || y >= board.count // 越界
            || x < 0 || x >= board.first!.count
            || visited[y][x] // 已访问过
            || board[y][x] != chars[index] { // 字符不匹配
            return false
        }
        
        visited[y][x] = true
        // 四个方向继续匹配
        if backtracking(board, &visited, y - 1, x, index + 1, chars) // 上
            || backtracking(board, &visited, y + 1, x, index + 1, chars) // 下
            || backtracking(board, &visited, y, x - 1, index + 1, chars) // 左
            || backtracking(board, &visited, y, x + 1, index + 1, chars) { // 右
            return true
        }
        visited[y][x] = false
        
        return false
    }
}
