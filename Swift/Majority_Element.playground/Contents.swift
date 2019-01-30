import Foundation

/**
 169. Majority Element

 Tags: Array、Divide and Conquer、Bit Manipulation
 
 https://leetcode.com/problems/majority-element/description/
 
 Notes: The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 */

/**
 Divide and Conquer实现, 152ms. 时间复杂度O(nlogN), 空间复杂度O(logN)
 */
class SolutionDivideAndConquer {
    func majorityElement(_ nums: [Int]) -> Int {
        return self.majorityInRange(0, nums.count - 1, nums)
    }
    
    private func majorityInRange(_ left: Int, _ right: Int, _ nums: [Int]) -> Int {
        if left == right {
            return nums[left]
        }
        
        let mid = (left + right) / 2
        let lMajor = self.majorityInRange(left, mid, nums)
        let rMajor = self.majorityInRange(mid + 1, right, nums)
        
        if lMajor == rMajor {
            return lMajor
        }
        
        let lMajorCount = self.countOfNumInRange(left, right, lMajor, nums)
        return lMajorCount > (right - left + 1) / 2 ? lMajor : rMajor
    }
    
    private func countOfNumInRange(_ left: Int, _ right: Int, _ num: Int, _ nums: [Int]) -> Int {
        var count = 0
        for i in left...right {
            if nums[i] == num {
                count += 1
            }
        }
        return count
    }
}

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
            if numCountDic[value]! > nums.count / 2 {
                return value
            }
        }
        return -1
    }
}

/**
 Sort实现, 240ms. 时间复杂度O(nlogN), 空间复杂度O(n)
 */
class SolutionSort {
    func majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return -1
        }
        let sortedNums = nums.sorted()
        return sortedNums[nums.count / 2] // majority占至少一半以上, 故取中间的数必定是majority
    }
}

/**
 位操作实现, 876ms. 时间复杂度O(64n 或 32n), 空间复杂度O(1)
 
 思路: 因为majority在数组中超过一半, 所以其每一位上出现的次数都超过1半. 故按位数, 遍历数组, 找出所有位数出现次数大于一半的, 组合成majority
 */
class SolutionBitManipulation {
    func majorityElement(_ nums: [Int]) -> Int {
        var majority = 0
        let halfCount = nums.count / 2
        for i in 0..<32 {
            var bitCount = 0
            for num in nums {
                if (num >> i) & 1 > 0 {
                    bitCount += 1
                    
                    if bitCount > halfCount {
                        majority += 1 << i
                        break
                    }
                }
            }
        }
        return majority
    }
}
