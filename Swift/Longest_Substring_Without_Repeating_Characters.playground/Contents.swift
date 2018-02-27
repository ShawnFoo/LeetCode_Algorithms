/*
Longest Substring Without Repeating Characters

Tag: String、Hash Table、Two Pointers

https://leetcode.com/problems/longest-substring-without-repeating-characters/description/

求最长无重复字符子串.

思路笔记:
我们可以借助字典、集合来存储不重复字符. 查询是否存在重复字符时时间复杂度为O(1). 空间换时间.
通过 sliding window滑动窗口(起点、终点确定子串范围) 来划分子串
*/

/// 时间复杂度为O(n)的求法. Swift实现中仅这个通过了最后一个测试用例, 一串超级长的字符串.
func lengthOfLongestSubstring(_ s: String) -> Int {
	if s.count <= 1 {
		return s.count
	}
	// key用来储存字符, value用来保存该字符最后一次出现的位置. 遍历一次字符串即可.
	var charIndexDic: [Character: Int] = [:]
	var longestLength = 0
	// 滑动窗口起始位置
	var start = 0
	// 滑动窗口终结位置
	var end = 0
	for endChar in s {
		// 第二个判断条件(已出现的字符位置要大于当前滑动窗口的起始位置). 因为不属于滑动窗口起始范围内的字符不属于重复字符.
		// 等于的目的是确保 出现相邻或连续相同的字符时 滑动窗口起始位置能向后正常滑动
		if charIndexDic.keys.contains(endChar) && charIndexDic[endChar]! >= start {
			start = charIndexDic[endChar]! + 1
		}
		longestLength = max(longestLength, end - start + 1)
		// 插入新字符 或 更新字符最后一次出现的位置
		charIndexDic[endChar] = end
		end += 1
	}
	
	return longestLength
}

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
