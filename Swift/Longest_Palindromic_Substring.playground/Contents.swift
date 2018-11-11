/*
Longest Palindromic Substring

Tag: String、Dynamic Programing

https://leetcode.com/problems/longest-palindromic-substring/description/
*/

/**
 
思路一: 抓住回文围绕中心对称的特点. 遍历每个字符时, 从字符所在位置向两侧展开, 直到两侧不相等时, 则可求得最大长度的回文子串.

然后根据当前字符位置以及当前位置回文长度, 即可求得 回文起始与末尾位置.

注: 中心对称分为两种情况
(1)单个字符两侧对称(如 abcba, 中间为'c', 回文长度为奇数)
(2)完全两侧对称(如 abccba, 中间为"cc", 回文长度为偶数)
*/
class Solution {
    // 时间复杂度为 O(n^2), 316ms
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var begin = 0
        var length = 0
        for i in 0..<chars.count {
            let oddLoc = locOfPalindrome(i, i, chars)
            let evenLoc = locOfPalindrome(i, i+1, chars)
            var maxLen = 0
            var maxBegin = 0
            if oddLoc.length > evenLoc.length {
                maxLen = oddLoc.length
                maxBegin = oddLoc.begin
            } else {
                maxLen = evenLoc.length
                maxBegin = evenLoc.begin
            }
            if length <= maxLen {
                begin = maxBegin
                length = maxLen
            }
        }
        return String(chars[begin..<begin+length])
    }

    func locOfPalindrome(_ left: Int, _ right: Int, _ chars: [Character]) -> (begin: Int, length: Int) {
        var begin = 0
        var length = Int.min
        var l = left
        var r = right
        while l >= 0 && r < chars.count && chars[l] == chars[r] {
            begin = l
            length = r - l + 1
            l -= 1
            r += 1
        }
        return (begin: begin, length: length)
    }
}
