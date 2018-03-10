/*
Roman to Integer

Tag: Math、 String

https://leetcode.com/problems/roman-to-integer/description/

罗马数字计算规则:
1. 相同的数字连写，所表示的数等于这些数字相加得到的数，如 Ⅲ=3；
2. 小的数字在大的数字的右边，所表示的数等于这些数字相加得到的数，如 Ⅷ=8、Ⅻ=12；
3. 小的数字（限于 Ⅰ、X 和 C）在大的数字的左边，所表示的数等于大数减小数得到的数，如 Ⅳ=4、Ⅸ=9；
*/

func romanToInt(_ s: String) -> Int {
	let romans = [
		Character("I"): 1,
		Character("V"): 5,
		Character("X"): 10,
		Character("L"): 50,
		Character("C"): 100,
		Character("D"): 500,
		Character("M"): 1000
	]
	let chars = Array(s)
	var num = 0
	var lastChar: Character?
	var i = s.count - 1
	while i >= 0 { // 从右往左遍历每个罗马字符
		let char = chars[i]
		if let lastChar = lastChar {
			let lastValue = romans[lastChar]!
			let value = romans[char]!
			if value >= lastValue { // 当前字符比后边的大或相等,  就加上之前的
				num += value
			}
			else { // 否则 减去之前的
				num -= value
			}
		}
		else { // 第一个数, 直接保存数值
			num = romans[char]!
		}
		lastChar = char
		i -= 1
	}
	return num
}
