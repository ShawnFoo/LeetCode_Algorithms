/**
 Remove Duplicates from Sorted Array
 
 Tag: Array、Two Pointers
 
 https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        var i = 0 // 记录上一个不重复的数
        for j in 1..<nums.count {
            if nums[i] != nums[j] {
                i += 1 // 坑位后移, 填充下一个不重复的数
                nums[i] = nums[j]
            }
        }
        if i+1 <= nums.count { // 移除剩余重复的数
            nums.removeSubrange((i+1)..<nums.count)
        }
        return nums.count
    }
}
