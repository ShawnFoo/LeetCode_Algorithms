import Foundation

/*
 Remove Element
 
 Tag: Array、Two Pointers
 
 https://leetcode.com/problems/remove-element/description/
 
 思路分析:

 主要读清楚题目, 题目要求移除所有指定值为val的元素, 并返回新的数组长度.
 特别要求是可修改传入的数组引用, 空间复杂度得为O(1), 不可分配额外的空间创建新的数组.
 
 所以可用考虑双指针遍历来填坑
 */

/// 单向遍历, 一个记录当前遍历位置, 另一个记录可替换值的坑位, 遍历过程中顺带替换掉所有val
class Solution1 {
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

/// Solution1的简化版. 利用慢指针的序号数作为"新数组"的数量
class SolutionImproved {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var index = 0 // 可以想象成将不等于val的元素添加入数组的过程
        for elem in nums {
            if elem != val {
                nums[index] = elem
                index += 1
            }
        }
        return index
    }
}

/// 前后双向遍历. 末尾元素倒序填入坑位. 因题意没要求结果有序, 故仅需移除指定值的元素即可.
class Solution2 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        var n = nums.count
        while i < n {
            if nums[i] == val { // 末尾元素用于填充坑位. 同时数量减一
                nums[i] = nums[n - 1]
                n -= 1
            } else {
                i += 1
            }
        }
        return n
    }
}

