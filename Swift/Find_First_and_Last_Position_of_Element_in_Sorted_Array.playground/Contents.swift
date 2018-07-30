import Foundation

/**
 Find First and Last Position of Element in Sorted Array
 
 Tags: Array、Binary Search
 
 https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/
 */

/**
 时间复杂度: O(logN)
 
 思路: 先用二分找到最左边target的位置, 然后再二分查找到最右边target的位置
 */
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var startIndex = findStartIndex(of: target, in: nums)
        var endIndex = findEndIndex(of: target, with: startIndex, in: nums)
        return [startIndex, max(endIndex, startIndex)]
    }
    
    private func findStartIndex(of target: Int, in nums: [Int]) -> Int {
        var low = 0
        var high = nums.count - 1
        var startIndex = -1
        while low <= high {
            var mid = (low + high) / 2
            let value = nums[mid]
            if value == target {
                startIndex = mid
                high = mid - 1
            } else if value < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return startIndex
    }
    
    private func findEndIndex(of target: Int, with left: Int, in nums: [Int]) -> Int {
        var low = left
        var high = nums.count - 1
        var endIndex = -1
        while low > -1 && low <= high {
            var mid = (low + high) / 2
            let value = nums[mid]
            if value == target {
                endIndex = mid
                low = mid + 1
            } else if value < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return endIndex
    }
}

/**
 思路: 先用二分查找到值为target的位置, 然后从该位置左右延伸查找首次以及最后一次出现的同值位置
 
 最差时间复杂度为: O(n), 比如一组都是重复的数字 [11111111], 1
 */
class Solution1 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var low = 0
        var high = nums.count - 1
        var startIndex = -1
        var endIndex = startIndex
        while low <= high {
            var mid = (low + high) / 2
            let value = nums[mid]
            if value == target { // 从中间向两边延展查询
                startIndex = mid
                endIndex = mid
                while startIndex > 0 && nums[startIndex - 1] == target {
                    startIndex -= 1
                }
                while endIndex < nums.count - 1 && nums[endIndex + 1] == target {
                    endIndex += 1
                }
                break
            } else if value < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return [startIndex, endIndex]
    }
}

Solution().searchRange([], 8)
Solution().searchRange([5,7,7,8,8,10], 8)
Solution().searchRange([5,7,7,8,8,10], 6)
