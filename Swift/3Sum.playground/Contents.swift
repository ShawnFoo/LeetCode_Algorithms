/*
 3Sum
 
 Tags: Array、 Two Pointers
 
 https://leetcode.com/problems/3sum/description/
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var sum: [[Int]] = []
        var numbers = nums
        self.quickSort(&numbers, low: 0, high: nums.count - 1)
        
        var i = 0
        while i < numbers.count-2 {
            let value = numbers[i]
            let twoValues = self.twoSum(numbers, l: i+1, r: numbers.count-1, target: -value)
            for twoValue in twoValues {
                var mTwoValue = twoValue
                mTwoValue.append(value)
                sum.append(mTwoValue)
            }
            
            repeat { // 跳过重复元素
                i += 1
            } while i < numbers.count && value == numbers[i]
        }
        return sum
    }
    
    func twoSum(_ nums: [Int], l: Int, r: Int, target: Int) -> [[Int]] {
        var sums: [[Int]] = []
        var begin = l, end = r
        
        while begin < end {
            let twoSum = nums[begin] + nums[end]
            if twoSum < target {
                begin += 1
            }
            else if twoSum > target {
                end -= 1
            }
            else {
                var arr = [nums[begin], nums[end]]
                sums.append(arr)
                while begin < end && nums[begin] == arr[0] {
                    begin += 1
                }
                while begin < end && nums[end] == arr[1] {
                    end -= 1
                }
            }
        }
        return sums
    }
    
    func quickSort(_ nums: inout [Int], low: Int, high: Int) {
        if high <= low {
            return
        }
        let pivot = nums[low]
        var l = low, h = high
        while l < h {
            while l < h && nums[h] >= pivot {
                h -= 1
            }
            if l < h {
                nums[l] = nums[h]
            }
            while l < h && nums[l] <= pivot {
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

var array = [0,0,0]
solution.threeSum(array)


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

