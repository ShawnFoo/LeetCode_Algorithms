import Foundation

/**
 67. Add Binary
 
 Tags: Math、String
 
 https://leetcode.com/problems/add-binary/description/
 */

/**
 Math实现, 24ms. 时间复杂度(a.count+b.count), 空间复杂度O(n)
 */
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let aChars = Array(a)
        let bChars = Array(b)
        var aIndex = aChars.count - 1
        var bIndex = bChars.count - 1
        var result = ""
        var addOne = false
        while aIndex >= 0 || bIndex >= 0 || addOne {
            let aValue = aIndex >= 0 ? Int(String(aChars[aIndex]))! : 0
            let bValue = bIndex >= 0 ? Int(String(bChars[bIndex]))! : 0
            let sum = aValue + bValue + (addOne ? 1 : 0)
            addOne = sum > 1
            
            result = "\(sum % 2)" + result
            aIndex -= 1
            bIndex -= 1
        }
        return result
    }
}

Solution().addBinary("1010", "1011")








