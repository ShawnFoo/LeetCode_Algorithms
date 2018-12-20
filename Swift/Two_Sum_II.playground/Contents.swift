import Foundation

/**
 167. Two Sum II - Input array is sorted
 
 Tags: Array、Two Pointers、Binary Search
 
 https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/
 */

/**
 哈希表实现, 40ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionHashTable {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        if numbers.count >= 2 {
            var table: [Int: Int] = [:] // value: index
            for i in 0..<numbers.count {
                let remian = target - numbers[i]
                if let index = table[remian] {
                    return [index+1, i+1]
                }
                if table[numbers[i]] == nil { // 仅存最小的index
                    table[numbers[i]] = i
                }
            }
        }
        return []
    }
}

/**
 暴力双循环实现, 48ms. 时间复杂度O(n^2), 空间复杂度O(1)
 */
class SolutionBruteForce {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        if numbers.count >= 2 {
            for i in 0..<numbers.count-1 {
                if i > 0 && numbers[i-1] == numbers[i] {
                    continue
                }
                for j in i+1..<numbers.count {
                    if j > i+1 && numbers[j-1] == numbers[j] {
                        continue
                    }
                    if numbers[i] + numbers[j] == target {
                        return [i+1, j+1]
                    }
                }
            }
        }
        return []
    }
}
