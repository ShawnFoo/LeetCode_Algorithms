import Foundation

/**
 Search in Rotated Sorted Array
 
 Tags: Array、 Binary Search
 
 https://leetcode.com/problems/search-in-rotated-sorted-array/description/
 */

/// 思路: 先二分查找收缩边界确定定位轴点位置, 然后利用轴点模拟顺序二分查找值
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // 先二分搜索确定轴点
        var pivot = pivotIndexOf(nums)
        print("\(nums) - \(pivot)")
        // 找到轴点后, 便借助中轴位置的差值 当有序数组进行常规二分查找
        var left = 0
        var right = nums.count - 1
        while left <= right {
            var mid = (left + right) / 2
            let midRealIndex = (mid + pivot) % nums.count
            let leftValue = nums[(left + pivot) % nums.count]
            let rightValue = nums[(right + pivot) % nums.count]
            let midValue = nums[midRealIndex]
            if midValue == target {
                return midRealIndex
            } else if (target < midValue) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
    
    /// 二分查找中轴. 不断左右收缩边界来确定中轴位置
    private func pivotIndexOf(_ nums: [Int]) -> Int {
        var pivot = 0
        if nums.count > 1 && nums.first! > nums.last! { // 先确认是旋转过后的无序数组
            var left = 0
            var right = nums.count - 1
            pivot = (left + right) / 2
            // 先确定轴点在前半区间还是后半区间
            if nums[left] > nums[pivot]  {
                right = pivot
            } else if nums[pivot] > nums[right] {
                left = pivot
            }
            while left < right - 1 {
                pivot = (left + right) / 2
                let l = (pivot - 1) % nums.count
                let r = (pivot + 1) % nums.count
                // 中轴点同时小于前后相邻的数. 否则就判断收缩左边还是右边界
                if (nums[pivot] < nums[l] && nums[pivot] < nums[r]) {
                    return pivot
                } else if (nums[pivot] > nums[left]) {
                    left = pivot
                } else if (nums[pivot] < nums[right]) {
                    right = pivot
                }
            }
            // 到这说明轴点 区间长度缩小为2了
            return nums[left] > nums[right] ? right : left
        }
        return pivot
    }
}

Solution().search([4,5,6,7,0,1,2], 0)
Solution().search([4,1], 1)
Solution().search([3,5,1], 0)
Solution().search([4], 4)
