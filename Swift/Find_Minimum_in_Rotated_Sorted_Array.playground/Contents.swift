import Foundation

/**
 153. Find Minimum in Rotated Sorted Array
 
 Tags: Array、Binary Search
 
 https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/
 */

/**
 二分实现, 24ms. 时间复杂度O(logn), 空间复杂度O(1)
 
 思路: 先判断有序区域, 判断有序区域第一个数是否为最小值即可
 */
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        if (nums.count <= 1 || nums.first! < nums.last!) {
            return nums.first ?? -1
        }
        var left = 0, right = nums.count - 1, mid = 0
        while left <= right {
            mid = (left + right) / 2
            if nums[mid] < nums[right] { // 右侧有序
                if nums[mid] < nums[(mid-1+nums.count) % nums.count]
                    && nums[mid] < nums[(mid+1) % nums.count] {
                    return nums[mid]
                } else {
                    right = mid - 1
                }
            } else { // 左侧有序
                if nums[left] < nums[(left-1+nums.count) % nums.count]
                    && nums[left] < nums[(left+1) % nums.count] {
                    return nums[left]
                } else {
                    left = mid + 1
                }
            }
        }
        return -1
    }
}

Solution().findMin([3, 4, 5, 1, 2])
Solution().findMin([3])
