import Foundation

/**
 88. Merge Sorted Array
 
 Tags: Array、Two Pointers
 
 https://leetcode.com/problems/merge-sorted-array/description/
 */

/**
 双指针实现, 16ms
 */
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var pit = m + n - 1
        var c1 = m - 1
        var c2 = n - 1
        while c1 >= 0 && c2 >= 0 {
            if nums1[c1] > nums2[c2] {
                nums1[pit] = nums1[c1]
                c1 -= 1
            } else {
                nums1[pit] = nums2[c2]
                c2 -= 1
            }
            pit -= 1
        }
        while c2 >= 0 {
            nums1[pit] = nums2[c2]
            pit -= 1
            c2 -= 1
        }
    }
}
