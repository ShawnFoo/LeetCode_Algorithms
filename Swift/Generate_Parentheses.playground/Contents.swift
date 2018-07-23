import Foundation

/**
 Generate Parentheses
 
 Tags: String、 Backtracking
 
 https://leetcode.com/problems/generate-parentheses/description/
 */


/*
 思路: 排列组合包含所有合法括号对的字符串. 想到回溯, 尝试组合所有可能的情况.
 
 一对括号占两个字符, 所以包含n个括号的字符串有2n个字符.
 
 使用一个占位字符“0”来表示该位置没有插入括号.
 
 实现模拟解析:
 第一次: "000000" // 根据n生成2n长度的占位字符串
 第二次: ["()0000", "(00)00", "(00"] // 把字符串传入特定方法, 每次替换入一对括号. 返回各种合法组合的数组
 第三次: 把所有包含占位字符的字符串继续传入特定方法, 继续生成组合.
 第n次: 重复上述操作, 直至所有字符串都不包含占位字符, 则说明所有组合都已生成. 返回结果
 */
class Solution {
    private static let placeholder = Character("0")
    private static let leftBracket = Character("(")
    private static let rightBracket = Character(")")
    
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 0 {
            return []
        } else if n == 1 {
            return ["()"]
        } else {
            var result = _generateParenthesis(String(repeating: Solution.placeholder, count: n * 2)) // n对括号占n*2个位置
            var finished = false // 是否所有字符串都组合完成
            while finished != true {
                finished = true
                var tempResult: [String] = []
                for setStr in result {
                    if setStr.contains(Solution.placeholder) { // 如果有包含placeholder的字符串, 说明还没有组合完
                        finished = false
                        tempResult.append(contentsOf: _generateParenthesis(setStr))
                    } else {
                        tempResult.append(setStr)
                    }
                }
                result = tempResult
            }
            return result
        }
    }
    
    /// 将包含placeholder的字符串进行"一次"括号替换, 返回所有可能的情况数组
    ///
    /// - Parameter str: 包含placeholder的字符串
    /// - Returns: 排列组合的情况
    private func _generateParenthesis(_ str: String) -> [String] {
        var result: [String] = []
        var chars = Array(str)
        for i in 0..<chars.count {
            if chars[i] == Solution.placeholder { // 找到第一个placeholder的位置
                var span = 1 // 右括号间隔 1、3、5..n个位置
                while i + span < chars.count {
                    var insertable = true
                    for j in i+1...i+span { // 检测左括号到插入右括号的位置间有没有括号, 有的话说明不可插入右括号
                        if chars[j] == Solution.leftBracket || chars[j] == Solution.rightBracket {
                            insertable = false
                            break
                        }
                    }
                    if insertable == false {
                        break
                    }
                    var replacedChars = chars
                    replacedChars[i] = Solution.leftBracket
                    replacedChars[i + span] = Solution.rightBracket
                    result.append(String(replacedChars))
                    span += 2
                }
                break
            }
        }
        return result
    }
}

print(Solution().generateParenthesis(3))
