import Foundation

/**
 217. Contains Duplicate
 
 Tags: Array、Hash Table
 
 https://leetcode.com/problems/contains-duplicate/description/
 */

/**
 Sort实现, 184ms. 时间复杂度O(nlogn), 空间复杂度O(n)
 */
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        let sortedArr = nums.sorted()
        var i = 1
        while i < sortedArr.count {
            if sortedArr[i - 1] == sortedArr[i] {
                return true
            }
            i += 1
        }
        return false
    }
}

/**
 Hash Table实现, 176ms. 时间复杂度O(1), 空间复杂度O(n)
 */
class SolutionHashTable {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        if nums.count > 1 {
            var map: Set<Int> = Set()
            for i in 0..<nums.count {
                if map.contains(nums[i]) {
                    return true
                }
                map.insert(nums[i])
            }
        }
        return false
    }
}
