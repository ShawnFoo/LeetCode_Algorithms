/*
 Integer to Roman
 
 Tags: Math、String
 
 https://leetcode.com/problems/integer-to-roman/description/
 
 思路: 这道题主要得了解罗马数字的组数规则(https://en.wikipedia.org/wiki/Roman_numerals)
 
 最主要的两条:
 1. 之多连续3个罗马字符累加
 2. 左边 小的罗马字符 至多1个, 所以留意 4、9、40、90、400、900的情况
 */

class Solution1 {
    func intToRoman(_ num: Int) -> String {
        if num < 0 || num > 3999 {
            return ""
        }
        var M = ["", "M", "MM", "MMM"]  // 千位
        var C = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]    // 百位
        var X = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]    // 十位
        var I = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]    // 个位
        // 几千 + 几百 + 几十 + 几个
        return M[num/1000] + C[(num%1000)/100] + X[(num%100)/10] + I[(num%10)]
    }
}

class Solution2 {
    func intToRoman(_ num: Int) -> String {
        if num < 0 || num > 3999 {
            return ""
        }
        let romans = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let romanValues = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        var roman = ""
        var n = num, i = 0
        while n > 0 {
            let c = min(n / romanValues[i], 3) // 因为小于4000, 又是从高位计算到低位, 900、400、90、40、9、4 的倍数不存在, 比如 1930 -> 930 -> 30 MCMXXX
            if c > 0 {
                for _ in 0..<c {
                    roman += romans[i]
                }
                n -= c * romanValues[i]
            }
            i += 1
        }
        return roman
    }
}

let solution = Solution1()
solution.intToRoman(1980)

let solution2 = Solution2()
solution2.intToRoman(1980)
