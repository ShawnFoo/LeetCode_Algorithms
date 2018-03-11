/*
Longest Common Prefix

Tag: String

https://leetcode.com/problems/longest-common-prefix/description/
*/

/*
思路: 暴力法.

因为是求所有字符串的公共前缀, 所以当存在所有字符串的公共前缀时, 任意两个字符串的公共前缀 一定包含 所有字符的公共前缀.

所以 我们可以先求得数组前两个元素的公共前缀, 然后用它去与剩余元素求公共前缀即可.
*/
func longestCommonPrefix(_ strs: [String]) -> String {
	if strs.count == 0 {
		return ""
	}
	else if strs.count == 1 {
		return strs[0]
	}
	var commons: [Character] = []
	let s0 = Array(strs[0])
	let s1 = Array(strs[1])
	var i = 0
	while i < min(s0.count, s1.count) { // 找出头两个字符串的公共前缀
		if s0[i] != s1[i] {
			break
		}
		commons.append(s1[i])
		i += 1
	}
	// 用前边求得公共前缀 与 剩余字符串匹配, 去除非公共字符, 剩下的即是公共前缀
	for j in 2..<strs.count {
		var k = 0
		let s = Array(strs[j])
		while k < min(s.count, commons.count) {
			if s[k] != commons[k] {
				break
			}
			k += 1
		}
		commons = Array(commons[0..<k])
		if commons.count == 0 {
			break
		}
	}
	return String(commons)
}
