/*
Longest Palindromic Substring

Tag: String、Dynamic Programing

https://leetcode.com/problems/longest-palindromic-substring/description/
*/

/**
思路一: 抓住回文围绕中心对称的特点. 遍历每个字符时, 从字符所在位置向两侧展开, 直到两侧不相等时, 则可求得最大长度的回文子串.

然后根据当前字符位置以及当前位置回文长度, 即可求得 回文起始与末尾位置.

注: 中心对称分为两种情况
(1)单个字符两侧对称(如 abcba, 中间为'a', 回文长度为奇数)
(2)完全两侧对称(如 abccba, 中间为"cc", 回文长度为偶数)
*/
class Solution {
    // 时间复杂度为 O(n^2)
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var start = 0
        var end = 0
        for i in 0..<chars.count-1 {
            // 单个字符 对称. 左右起始位置都传入i
            let space = self.maxSpaceBetween(i, and: i, of: chars)
            var space2 = 0
            if chars[i] == chars[i+1] { // 相邻字符相等
                // 中心双字符对称. 左右起始位置传入i、i+1
                space2 = self.maxSpaceBetween(i, and: i+1, of: chars)
            }
            // 更新最大回文子串的 始末位置
            if end - start < max(space, space2) {
                if space >= space2 { // 单个字符对称始末位置间隔更大. 即回文子串长度更长.
                    start = i - space/2
                    end = i + space/2
                }
                else { // 完全对称. 回文子串长度为偶数
                    start = i - space2 / 2
                    end = i + 1 + space2 / 2
                }
            }
        }
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(s.startIndex, offsetBy: end)
        // 最后根据 最大长度回文子串 的始末位置 截取子串
        return String(s[startIndex...endIndex])
    }
    
    /**
     从指定位置向两侧延伸, 求当前位置计算的回文 起始位置最大间隔.
     */
    func maxSpaceBetween(_ leftIndex: Int, and rightIndex: Int, of chars: [Character]) -> Int {
        let count = chars.count
        var left = leftIndex
        var right = rightIndex
        var space = 0
        while left >= 0 && right < count && chars[left] == chars[right] {
            space = right - left
            left -= 1
            right += 1
        }
        return space;
    }
}

