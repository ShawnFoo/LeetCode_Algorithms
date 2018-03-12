/*
Longest Common Prefix

Tag: String

https://leetcode.com/problems/longest-common-prefix/description/
*/

/**
思路: 暴力法一

因为是求所有字符串的公共前缀, 所以当存在所有字符串的公共前缀时, 任意两个字符串的公共前缀 一定包含 全部字符的公共前缀.

所以 我们可以先求得数组前两个元素的公共前缀, 然后用它去与剩余元素求公共前缀即可.
*/
func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    var commons: [Character] = Array(strs[0])
    for i in 1..<strs.count {
        let s = Array(strs[i])
        var j = 0
        while j < min(s.count, commons.count) {
            if s[k] != commons[k] {
                break
            }
            k += 1
        }
        commons = Array(commons[0..<j])
        if commons.count == 0 {
            break
        }
    }
    return String(commons)
}

/**
思路: 暴力法二.

按位垂直遍历每个字符. 直至同位置某个字符串上的字符不匹配则停止

0 1 2
a b c
a b d
a c d
*/
func longestCommonPrefix2(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    var commons: [Character] = Array(strs.first!)
    for i in 0..<commons.count {
        for j in 1..<strs.count {
            let s = Array(strs[j])
            if i >= s.count || s[i] != commons[i] {
                return String(Array(commons[0..<i]))
            }
        }
    }
    return String(commons)
}
