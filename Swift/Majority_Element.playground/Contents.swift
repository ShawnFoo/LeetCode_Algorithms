import Foundation

/**
 169. Majority Element

 Tags: Array、Divide and Conquer、Bit Manipulation
 
 https://leetcode.com/problems/majority-element/description/
 
 Notes: The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 */

/**
 Hash Table实现, 180ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionHashTable {
    func majorityElement(_ nums: [Int]) -> Int {
        var numCountDic: [Int: Int] = [:]
        for i in 0..<nums.count {
            let value = nums[i]
            if let count = numCountDic[value] {
                numCountDic[value] = count + 1
            } else {
                numCountDic[value] = 1
            }
            if numCountDic[value] > nums.count / 2 {
                return value
            }
        }
        return -1
    }
}

/**
 暴力法, 256ms. 时间复杂度O(n^2), 空间复杂度O(n)
 */
class SolutionBruteForce {
    func majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return -1
        }
        let sortedNums = nums.sorted()
        var count = 0
        var curValue = sortedNums.first!
        for i in 0..<sortedNums.count {
            if curValue == sortedNums[i] {
                count += 1
            } else {
                curValue = sortedNums[i]
                count = 1
            }
            if count > sortedNums.count / 2 {
                return curValue
            }
        }
        return -1
    }
}
