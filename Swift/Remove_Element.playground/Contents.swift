import Foundation

/*
 Remove Element
 
 Tag: Array、Two Pointers
 
 https://leetcode.com/problems/remove-element/description/
 
 思路分析:

 主要读清楚题目, 题目要求移除所有指定值为val的元素, 并返回新的数组长度.
 特别要求是可修改传入的数组引用, 空间复杂度得为O(1), 不可分配额外的空间创建新的数组.
 
 所以可用考虑双指针与填坑. 一个记录当前遍历位置, 另一个记录可替换值的坑位, 遍历过程中顺带替换掉所有val
 */
class Solution {
    // 时间复杂度O(n), 空间复杂度O(1)
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var pitCount = 0 // 坑位数, 用于返回结果计算
        if nums.count > 0 {
            var curIndex = 0 // 当前遍历Index
            var pitIndex = -1 // 可替换的坑位Index(即值等于val的最近记录的Index)
            while curIndex < nums.count {
                let curValue = nums[curIndex]
                if curValue == val {
                    if pitCount == 0 { // 首次找到值等于val的元素
                        pitIndex = curIndex
                    }
                    pitCount += 1
                } else if pitCount > 0 { // 有坑位, 需换位
                    nums[pitIndex] = curValue
                    pitIndex += 1 // 每换位一个元素, 坑位Index就后移一位
                }
                curIndex += 1
            }
        }
        return nums.count - pitCount
    }
}
