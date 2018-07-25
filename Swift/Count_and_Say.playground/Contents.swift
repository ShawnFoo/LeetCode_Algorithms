import Foundation

/**
 Count and Say
 
 Tags: String
 
 https://leetcode.com/problems/count-and-say/
 */

/// 这道题主要把题意读对. 题意为按顺序计算重复的数并且"读"出该数的数值来. 即先计算重复的数的个数, 然后再拼接上该数本身.
class Solution {
    func countAndSay(_ n: Int) -> String {
        if n >= 1 {
            var times = 1
            var result = [Character("1")]
            while times < n {
                var i = 0
                var temp: [Character] = []
                while i < result.count {
                    let value = result[i]
                    var count = 1
                    while i + count < result.count && result[i] == result[i + count] {
                        count += 1
                    }
                    // 先count, 即出现该value的个数. 然后say, 即该value
                    temp.append(Character("\(count)"))
                    temp.append(Character("\(value)"))
                    i += count
                }
                result = temp
                times += 1
            }
            return String(result)
        }
        return ""
    }
}

Solution().countAndSay(1)
Solution().countAndSay(2)
Solution().countAndSay(3)
Solution().countAndSay(4)
Solution().countAndSay(5)
Solution().countAndSay(6)
Solution().countAndSay(7)
