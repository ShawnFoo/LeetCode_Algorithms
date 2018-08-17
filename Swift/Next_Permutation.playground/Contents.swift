import Foundation

/**
 31. Next Permutation
 
 Tags: Array
 
 https://leetcode.com/problems/next-permutation/description/
 */

/**
 时间复杂度O(n), 空间复杂度O(1)
 
 思路: 从后倒序遍历, 找到第一次出现降序的位置, 该位置以后的子序列为升序

 序号: 0, 1, 2, 3, 4, 5, 6
 比如: 1, 3, 5, 7, 6, 4, 2
 
 5(index == 2)所在位置为降序位置, 其后的子序列为升序(从后遍历), 在升序的子序列里边找到一个刚好大于5的, 为6(index == 4)与5进行替换. 再对5以后的升序数组倒序一次求得最小值即为下一个组合
 */
class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count <= 1 {
            return
        }
        // 以下升序或降序是基于倒序遍历的
        var i = nums.count - 1
        var descIndex = -1
        while i > 0 { // 找首次出现降序的位置
            if nums[i - 1] < nums[i] {
                descIndex = i - 1
                break
            }
            i -= 1
        }
        if descIndex > -1 { // 有降序位置, 位于其后的子序列为升序, 找到最小满足大于它的数进行位置交换, 再对其后边的序列进行倒序, 求得最小
            var j = descIndex + 1
            while j < nums.count - 1 {
                if nums[j] > nums[descIndex] && nums[j + 1] <= nums[descIndex] {
                    break
                }
                j += 1
            }
            // 先交换位置
            nums[j] += nums[descIndex]
            nums[descIndex] = nums[j] - nums[descIndex]
            nums[j] = nums[j] - nums[descIndex]
            // 然后区域倒序
            reverseArea(descIndex + 1, nums.count - 1, &nums)
        } else { // 数组有序, ASC, 直接倒序成最小值
            reverseArea(0, nums.count - 1, &nums)
        }
    }
    
    /// 区域倒序
    private func reverseArea(_ fromIndex: Int, _ toIndex: Int, _ nums: inout [Int]) {
        let mid = (fromIndex + toIndex) / 2
        var start = fromIndex
        var index = 0
        while start <= mid {
            let match = (toIndex - fromIndex) - index + fromIndex // 变形自 (nums.count - 1) - 序号 + offset
            let temp = nums[start] + nums[match]
            nums[start] = temp - nums[start]
            nums[match] = temp - nums[match]
            start += 1
            index += 1
        }
    }
}

var arr = [1,2,3,4,5]
Solution().nextPermutation(&arr)
arr = [3, 1, 2]
Solution().nextPermutation(&arr)
arr = [1, 3, 2]
Solution().nextPermutation(&arr)
