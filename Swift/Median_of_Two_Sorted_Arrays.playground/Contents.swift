/*
Median of Two Sorted Arrays

Tag: Array、Binary Search、Divide and Conquer(分治法)

https://leetcode.com/problems/median-of-two-sorted-arrays/description/

求两个有序数组的中位数数值.
*/

/**
该解法非最优解! 思路为把两个有序数组抽象为一个数组N进行遍历, 如MergeSort最后一遍合并两个有序数组,
一边排序一边遍历, 当遍历到数组N的中间两个(长度为奇数时则取中间那个)即获得中位数求得数值

若数组1长度为m, 数组2长度为n, 则最多遍历 (m+n)/2 次. 故时间复杂度为 O(n)
*/
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let n1Count = nums1.count
    let n2Count = nums2.count
    let isOdd = (n1Count + n2Count) % 2 != 0
    let mid = (n1Count + n2Count) / 2
    var i = 0
    var n1 = 0
    var n2 = 0
    var median: Double = 0
    var num = 0
    while n1 < n1Count || n2 < n2Count {
        // 排序
        if n1 < n1Count && n2 < n2Count {
            if nums1[n1] <= nums2[n2] {
                num = nums1[n1]
                n1 += 1;
            }
            else {
                num = nums2[n2]
                n2 += 1;
            }
        }
        else if n1 < n1Count {
            num = nums1[n1]
            n1 += 1
        }
        else {
            num = nums2[n2]
            n2 += 1
        }
        // 找中位
        if i == mid - 1  {
            if !isOdd {
                median += Double(num)
            }
        }
        else if i == mid {
            median += Double(num)
            if !isOdd {
                median /= 2.0
            }
            break
        }
        i += 1;
    }
    return median
}
