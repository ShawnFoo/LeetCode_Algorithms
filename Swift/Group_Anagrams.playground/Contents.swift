import Foundation

/**
 
 49. Group Anagrams
 
 Tags: Hash Table、String
 
 https://leetcode.com/problems/group-anagrams/description/
 
 题意: 将各个包含相同字符的字符串归并为一个组合, 输出所有组合
 */

/**
 使用Hash Table实现. 关键是为包含相同字符的字符串生成一个唯一Key.
 
 不同于Solution1先对字符串的字符进行排序后生成HashKey, 此处借助Hash算法, 使用质数相乘求出唯一的Key值
 */
class Solution {
    // 26个英文字符各对应一个非1的质数
    private static let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103]
    private static let aAscii = Int("a".unicodeScalars.first!.value)
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groupsDic: [Int: [String]] = [:]
        for str in strs {
            let key = _hashKey(str)
            if groupsDic[key] == nil {
                groupsDic[key] = []
            }
            groupsDic[key]?.append(str)
        }
        return Array(groupsDic.values)
    }
    
    private func _hashKey(_ str: String) -> Int {
        // 质数相乘求得字符组合的唯一乘积, 相比于简单相加Hash值, 不会出现Hash值冲突
        var hash = 1
        let chars = Array(str)
        for char in chars {
            let assii = Int(String(char).unicodeScalars.first!.value)
            hash = hash &* Solution.primes[assii - Solution.aAscii]
        }
        return hash
    }
}

/**
 使用Hash Table实现. 关键是为包含相同字符的字符串生成一个唯一Key. 生成key前会对字符串按字符大小进行排序
 */
class Solution1 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groupsDic: [String: [String]] = [:]
        for str in strs {
            let key = _hashKey(str)
            if groupsDic[key] == nil {
                groupsDic[key] = []
            }
            groupsDic[key]?.append(str)
        }
        return Array(groupsDic.values)
    }
    
    private func _hashKey(_ str: String) -> String {
        return String(Array(str).sorted())
    }
}
