/*
3. Longest Substring Without Repeating Characters

Tag: String、Hash Table、Two Pointers

https://leetcode.com/problems/longest-substring-without-repeating-characters/description/

求最长无重复字符子串.

思路笔记:
我们可以借助字典、集合来存储不重复字符. 查询是否存在重复字符时时间复杂度为O(1). 空间换时间.
通过 sliding window滑动窗口(起点、终点确定子串范围) 来划分子串
*/

/**
 滑动窗口实现(Hash Table+Two Pointers). 时间复杂度O(n). 空间复杂度O(n)
 
 借助字典记录每个字符最后1次出现的位置
 */
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count <= 1 {
            return s.count
        }
        var charIndexDic: [Character: Int] = [:]
        let chars = Array(s)
        var start = 0 // 滑动窗口起始位置. 滑动窗口范围内始终为不重复的子串
        var maxLength = 0
        for end in 0..<chars.count {
            let endChar = chars[end]
            if let index = charIndexDic[endChar], index >= start { // 上一个的重复字符位置在窗口的范围内, 则取上个重复字符后边1个位置为新的窗口起点
                start = index + 1
            }
            maxLength = max(maxLength, end - start + 1)
            charIndexDic[endChar] = end
        }
        return maxLength
    }
}

SolutionDP().lengthOfLongestSubstring("abcabcbb")
SolutionDP().lengthOfLongestSubstring("abba")

/*
-------------- 以下两种除了最后一个测试用例Time Limit Exceeded, 其他982个测试用例均通过  ------------------------

导致超时的一个影响因素是 Swift通过Index获取String中的指定字符效率太低

把字符串转化成utf8的数组进行遍历或许能行.
*/

/// 借助集合实现的方式. Time Limit Exceeded : (
func lengthOfLongestSubstring2(_ s: String) -> Int {
    var substringChars = Set<Character>()
    var longestLength = 0
    let sLength = s.count
    var start = 0
    var end = 0
    for endChar in s {
        end += 1
        if !substringChars.contains(endChar) {
            substringChars.insert(endChar)
        }
        else {
            while start < sLength {
                let startChar = s[s.index(s.startIndex, offsetBy: start)]
                start += 1
                if startChar == endChar {
                    break
                }
                substringChars.remove(startChar)
            }
        }
        longestLength = max(longestLength, end - start)
    }
    return longestLength
}

/// 暴力法..不解释.. 出现Time Limit Exceeded可接受
func lengthOfLongestSubstring3(_ s: String) -> Int {
    var substringChars = Set<Character>()
    var longestLength = 0
    for i in 0..<s.count {
        let startChar = s[s.index(s.startIndex, offsetBy:i)]
        substringChars.insert(startChar)
        for j in i+1..<s.count {
            let char = s[s.index(s.startIndex, offsetBy:j)]
            if substringChars.contains(char) {
                break
            }
            substringChars.insert(char)
        }
        if substringChars.count > longestLength {
            longestLength = substringChars.count
        }
        substringChars.removeAll()
    }
    return longestLength
}
