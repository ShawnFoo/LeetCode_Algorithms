import Foundation

/**
 81. Search in Rotated Sorted Array II
 
 Tags: Array、Binary Search
 
 https://leetcode.com/problems/search-in-rotated-sorted-array-ii/description/
 */

/**
 二分查找实现, 48ms.
 */
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        if nums.isEmpty {
            return false
        }
        var low = 0
        var high = nums.count - 1
        var mid = 0
        while low <= high {
            mid = (high + low) / 2
            if target == nums[mid] {
                return true
            }
            // 临界判断去重
            if mid != high && nums[mid] == nums[high] {
                high -= 1
            } else if mid != low && nums[mid] == nums[low] {
                low += 1
            } else if nums[mid] < nums[high] { // 右侧有序
                if nums[mid] < target && target <= nums[high] {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            } else {
                if nums[low] <= target && target < nums[mid] {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            }
        }
        return false
    }
}

Solution().search([3,5,1], 3)

