import Foundation

/**
 69. Sqrt(x)
 
 Tags: Math、Binary Search
 
 https://leetcode.com/problems/sqrtx/description/
 */

/**
 二分查找实现, 20ms
 
 思路: 注意相加相乘时Int溢出即可
 */
class SolutionBinarySearch {
    func mySqrt(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }
        var low = 1
        var high = Int.max
        while low <= high {
            let mid = low + (high - low) / 2 // 防溢出
            if mid <= x / mid {
                let next = mid + 1
                if next > x / next {
                    return mid
                } else {
                    low = mid + 1
                }
            } else {
                high = mid - 1
            }
        }
        return -1
    }
}

class Solution {
    func mySqrt(_ x: Int) -> Int {
        var r = x
        while r > x / r {
            r =
        }
    }
}

SolutionBinarySearch().mySqrt(9)
