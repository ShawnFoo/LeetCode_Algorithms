import Foundation

/*
 Search Insert Position
 
 Tag: Array、Binary Search
 
 https://leetcode.com/problems/search-insert-position/description/
 */


/// 二分查找, 时间复杂度O(logn).
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        var mid = (start + end) / 2
        while start <= end {
            let value = nums[mid]
            if value == target {
                return mid
            } else if value < target {
                start = mid + 1
            } else {
                end = mid - 1
            }
            mid = (start + end) / 2
        }
        return max(start, end) // 若未找到target, 则终止位置为插入位置
    }
}

Solution().searchInsert([6], 5)
