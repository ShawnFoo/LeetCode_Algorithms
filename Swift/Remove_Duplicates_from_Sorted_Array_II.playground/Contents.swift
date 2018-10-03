import Foundation

/**
 80. Remove Duplicates from Sorted Array II

 Tags: Array、Two Pointers
 
 https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/description/
 */

/**
 双指针实现, 时间复杂度O(n), 空间复杂度O(1)
 
 快指针计算重复次数, 慢指针记录替换的坑位
 */
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count > 0 {
            let kMaxRepeats = 2
            var num = nums.first! // 当前数
            var repeats = 1 // 当前数出现次数
            var pitIndex = 1 // 坑位
            for i in 1..<nums.count {
                if num == nums[i] {
                    repeats += 1
                } else {
                    num = nums[i]
                    repeats = 1
                }
                if repeats <= kMaxRepeats {
                    nums[pitIndex] = nums[i]
                    pitIndex += 1
                }
            }
            return pitIndex
        }
        return 0
    }
}

var arr = [0,0,0,1,1,1,1,2,3,3]
Solution().removeDuplicates(&arr)
arr
