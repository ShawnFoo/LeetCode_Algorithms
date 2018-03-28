/*
 3Sum
 
 Tags: Array、 Two Pointers
 
 https://leetcode.com/problems/3sum/description/
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var numbers = nums
        self.quickSort(&numbers, low: 0, high: nums.count - 1)
        
        return []
    }
    
    func twoSum(_ nums: [Int], l: Int, r: Int, sum: Int) -> [[Int]] {
        var sums: [[Int]] = []
        return []
    }
    
    func quickSort(_ nums: inout [Int], low: Int, high: Int) {
        if high <= low {
            return
        }
        let pivot = nums[low]
        var l = low, h = high
        while l < h {
            while l < h && nums[h] > pivot {
                h -= 1
            }
            if l < h {
                nums[l] = nums[h]
            }
            while l < h && nums[l] < pivot {
                l += 1
            }
            if l < h {
                nums[h] = nums[l]
            }
        }
        nums[l] = pivot
        
        quickSort(&nums, low: low, high: l-1)
        quickSort(&nums, low: l+1, high: high)
    }
}

let solution = Solution()

// 暴力法.. 超时
class Solution1 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var allSum: [[Int]] = []
        if nums.count >= 3 {
            for i in 0..<nums.count-1 {
                for j in i+1..<nums.count {
                    for z in 0..<nums.count where z != i && z != j {
                        if nums[i] + nums[j] + nums[z] == 0 {
                            allSum.append([nums[i], nums[j], nums[z]])
                        }
                    }
                }
            }
        }
        var uniqueSum: [[Int]] = []
        for elemSet in allSum {
            if uniqueSum.index(where: { Set($0) == Set(elemSet) }) == nil {
                uniqueSum.append(elemSet)
            }
        }
        return uniqueSum
    }
}

