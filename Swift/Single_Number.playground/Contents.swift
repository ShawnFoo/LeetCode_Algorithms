import Foundation

/**
 136. Single Number
 
 Tags: Hash Table、Bit Manipulation
 
 https://leetcode.com/problems/single-number/description/
 */

/**
 异或实现, 92ms. 时间复杂度O(n), 空间复杂度O(1)
 
 思路: 异或操作同位相同为0, 不同为1
 */
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
}

/**
 排序实现, 132ms. 时间复杂度O(n*logn), 空间复杂度O(n)
 */
class SolutionSort {
    func singleNumber(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return -1
        }
        let sortedNums = nums.sorted() // 整体时间复杂度取决于排序算法的实现
        var i = 0
        while i < sortedNums.count - 1 {
            if sortedNums[i] != sortedNums[i + 1] {
                return sortedNums[i]
            }
            i += 2
        }
        return sortedNums.last! // 单个 或 多个(最后一个为不重复) 都符合
    }
}

/**
 哈希表实现, 104ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionHashTable {
    func singleNumber(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return -1
        }
        var dic: [Int: Int] = [:] // value : count
        for num in nums {
            if let count = dic[num] {
                dic[num] = count + 1
            } else {
                dic[num] = 1
            }
        }
        for (value, count) in dic {
            if count == 1 {
                return value
            }
        }
        return -1
    }
}


SolutionSort().singleNumber([2, 2, 1])
