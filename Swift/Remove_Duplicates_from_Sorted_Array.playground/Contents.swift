/**
 Remove Duplicates from Sorted Array
 
 Tag: Array、Two Pointers
 
 https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/
 */

/**
 双指针实现. 时间复杂度O(n), 空间复杂度O(1)
 */
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        var pit = 1
        var i = 1
        var lastVal = nums.first!
        while i < nums.count {
            if nums[i] != lastVal {
                nums[pit] = nums[i]
                pit += 1
                lastVal = nums[i]
            }
            i += 1
        }
        return pit
    }
}

var arr = [1, 1, 2, 2, 2]
Solution().removeDuplicates(&arr)
arr = [1, 1, 1, 1, 1]
Solution().removeDuplicates(&arr)

