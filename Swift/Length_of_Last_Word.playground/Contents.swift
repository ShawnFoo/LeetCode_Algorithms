import Foundation

/**
 58. Length of Last Word
 
 Tags: String

 https://leetcode.com/problems/length-of-last-word/description/
 */

/**
 倒序遍历. 12ms
 */
class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var length = 0
        let chars = Array(s)
        var i = chars.count - 1
        while i >= 0 {
            if chars[i] != " " {
                length += 1
            } else if length > 0 { // 为空格且遇到过词组
                break
            }
            i -= 1
        }
        return length
    }
}
