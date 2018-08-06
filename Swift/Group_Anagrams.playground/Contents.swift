import Foundation

/**
 
 49. Group Anagrams
 
 Tags: Hash Table、String
 
 https://leetcode.com/problems/group-anagrams/description/
 
 题意: 将各个包含相同字符的字符串归并为一个组合, 输出所有组合
 */

/**
 使用Hash Table实现. 关键是为包含相同字符的字符串生成一个唯一Key. 生成key前会对字符串按字符大小进行排序
 */
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groupsDic: [String: [String]] = [:]
        for str in strs {
            let key = _hashKey(str)
            var strGroups: [String]? = groupsDic[key]
            if strGroups == nil {
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
