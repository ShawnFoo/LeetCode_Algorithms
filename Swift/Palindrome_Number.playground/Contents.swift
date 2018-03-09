/*
Palindrome Number

Tag: Math

https://leetcode.com/problems/palindrome-number/description/
*/

/**
思路: 回文中心对称, 故回文数的对称部分数值一定相当.

比如 "1234321" 奇数位的回文数去除中间的4, 前后"123" 与 "321"的反转数值相等.

偶数位的回文数 "123321" 前后部分 "123" == "123"(321的反转数)
*/
func isPalindrome(_ x: Int) -> Bool {
	if x < 0 { // 负数一定不是回文数
		return false
	}
	var xx = x
	var digits: Int = 0 // 位数
	while xx > 0 {
		digits += 1
		xx /= 10
	}
	xx = x
	var num = 0
	// 知道位数后, 直接中间截断, 后半段进行反转
	for _ in 0..<digits/2 {
		num *= 10
		num += xx % 10
		xx /= 10
	}
	if digits % 2 != 0 { // 奇数位 去除中间数字
		xx /= 10
	}
	// 前半部分数值 若等于 后半部分的反转数数值, 那就是回文数
	return num == xx
}

