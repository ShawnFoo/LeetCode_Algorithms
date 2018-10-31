import Foundation

/**
 215. Kth Largest Element in an Array
 
 Tags: Divide and Conquer, Heap
 
 https://leetcode.com/problems/kth-largest-element-in-an-array/description/
 */

/**
 分治实现. 时间复杂度O(nLogn)
 */
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        if nums.isEmpty || nums.count < k {
            return -1
        }
        var arr = nums
        return quickSort(&arr, k, 0, nums.count-1)
    }

    private func quickSort(_ nums: inout [Int], _ k: Int, _ low: Int, _ high: Int) -> Int {
        if low < high {
            // 常规快排
            let pivot = nums[low]
            var l = low
            var h = high
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
            // 每次排完后, 可以缩半, 根据k的序号位置, 决定继续分治的区域
            let target = nums.count - k
            if l == target {
                return pivot
            } else if l < target {
                return quickSort(&nums, k, l+1, high)
            } else {
                return quickSort(&nums, k, low, l-1)
            }
        }
        return nums[low]
    }
}
