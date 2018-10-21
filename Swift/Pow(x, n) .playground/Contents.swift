import Foundation

/**
 50. Pow(x, n)
 
 Tags: Math、Binary Search
 
 https://leetcode.com/problems/powx-n/description/
 */

/**
 二分实现, 8ms
 */
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        let toPow = abs(n)
        var num = x
        var pow = toPow
        var oddNum = 1.0
        while pow > 1 {
            if pow % 2 == 0 {
                num *= num
                pow /= 2
            } else {
                oddNum *= num
                pow -= 1
            }
        }
        num *= oddNum
        return n < 0 ? 1.0 / num : num
    }
}

/**
 二分递归实现, 12ms
 */
class SolutionRecursive {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        let num = n < 0 ? 1.0 / x : x
        let toPow = abs(n)
        return toPow % 2 == 0 ? myPow(num * num, toPow / 2) : num * myPow(num * num, toPow / 2)
    }
}

Solution().myPow(34.00515, -3)
Solution().myPow(2, 10)


