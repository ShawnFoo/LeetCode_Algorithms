import Foundation

/*
 Valid Parentheses
 
 Tag: String、Stack
 
 https://leetcode.com/problems/valid-parentheses/description/
 
 平衡括号串
 */

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 == 0 { // 匹配串必为偶数
            let chars: [Character] = Array(s)
            let kLeftBrackets: [Character] = Array("({[")
            let kRightBrackets: [Character] = Array(")}]") // 开闭括号index对应
            var i = 0
            var stack: [Character] = []
            while i < chars.count {
                let char = chars[i]
                if let left = kLeftBrackets.index(of: char) { // 若为开阔号则入栈
                    stack.append(char)
                } else if let right = kRightBrackets.index(of: char) { // 若为闭括号则出栈匹配
                    if let topChar = stack.last { // 栈顶元素对比
                        if right == kLeftBrackets.index(of: topChar) { // index相等则匹配
                            stack.removeLast()
                        } else { // 不匹配
                            return false
                        }
                    } else { // 栈为空, 不匹配
                        return false
                    }
                }
                i += 1
            }
            return stack.count == 0 // 一一对应完后, 栈中应为空才对
        }
        return false
    }
}
