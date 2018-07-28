import Foundation

/**
 Search in Rotated Sorted Array
 
 Tags: Array、 Binary Search
 
 https://leetcode.com/problems/search-in-rotated-sorted-array/description/
 */

/**
 时间复杂度: log(N).
 
 思路: 二分过程中, 每次选在顺序区间内进行查找, 然后缩小target所在区间
 */
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let mid = (low + high) / 2
            if nums[mid] == target {
                return mid
            }
            // 判断顺序区间
            if nums[mid] <= nums[high] {
                // 判断target是否在顺序区间内
                if target > nums[mid] && target <= nums[high] {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            } else {
                // 同理
                if target >= nums[low] && target < nums[mid] {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            }
        }
        return -1
    }
}

/**
 时间复杂度: 2 * log(N)
 
 思路: 先二分查找收缩边界确定定位轴点位置, 然后利用轴点模拟顺序二分查找值
 */
class Solution1 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // 先二分搜索确定轴点
        let pivot = pivotIndexOf(nums)
        print("\(nums) - \(pivot)")
        // 找到轴点后, 便借助中轴位置的差值 当有序数组进行常规二分查找
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let mid = (low + high) / 2
            let midRealIndex = (mid + pivot) % nums.count
            let midValue = nums[midRealIndex]
            if midValue == target {
                return midRealIndex
            } else if (target < midValue) {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return -1
    }
    
    /// 二分查找中轴. 不断左右收缩边界来确定中轴位置
    private func pivotIndexOf(_ nums: [Int]) -> Int {
        var pivot = 0
        if nums.count > 1 && nums.first! > nums.last! { // 先确认是旋转过后的无序数组
            var low = 0
            var high = nums.count - 1
            pivot = (low + high) / 2
            // 先确定轴点在前半区间还是后半区间
            if nums[low] > nums[pivot]  {
                high = pivot
            } else if nums[pivot] > nums[high] {
                low = pivot
            }
            while low < high - 1 {
                pivot = (low + high) / 2
                let l = (pivot - 1) % nums.count
                let r = (pivot + 1) % nums.count
                // 中轴点同时小于前后相邻的数. 否则就判断收缩左边还是右边界
                if (nums[pivot] < nums[l] && nums[pivot] < nums[r]) {
                    return pivot
                } else if (nums[pivot] > nums[low]) {
                    low = pivot
                } else if (nums[pivot] < nums[high]) {
                    high = pivot
                }
            }
            // 到这说明轴点 区间长度缩小为2了
            return nums[low] > nums[high] ? high : low
        }
        return pivot
    }
}

Solution().search([4,5,6,7,0,1,2], 0)
Solution().search([4,1], 1)
Solution().search([3,5,1], 0)
Solution().search([4], 4)

Solution1().search([4,5,6,7,0,1,2], 0)
Solution1().search([4,1], 1)
Solution1().search([3,5,1], 0)
Solution1().search([4], 4)
