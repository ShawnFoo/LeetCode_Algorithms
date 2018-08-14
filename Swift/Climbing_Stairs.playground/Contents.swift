import Foundation

/**
 70. Climbing Stairs

 Tags: Dynamic Programming
 
 https://leetcode.com/problems/climbing-stairs/description/
 */

/**
 动态规划实现. 时间复杂度O(n), 空间复杂度O(1)
 
 由下边递归+Memo实现推出的公式: F(n) = F(n-1) + F(n-2)
 */
class SolutionDP {
    func climbStairs(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        // 若2步到顶, 有以下爬法
        var thePrevTwo = 1 // 前2步的所有爬法
        var thePrevOne = thePrevTwo + 1 // 前1步的所有爬法
        var i = 2
        while i < n {
            let cur = thePrevOne + thePrevTwo
            thePrevTwo = thePrevOne
            thePrevOne = cur
            i = i + 1
        }
        return thePrevOne
    }
}

/**
 花n步爬到顶, 每次可以走1或2步, 则第n步的爬法 = 前1步的爬法 + 前2步爬法 之和 F(n) = F(n-1) + F(n-2)
 
 思路: 递归+Memo备忘。 时间复杂度O:(n), 空间复杂度:O(n)
 */
class Solution {
    func climbStairs(_ n: Int) -> Int {
        var memo: [Int] = Array(repeating: 0, count: n)
        return _climbStairs(n, &memo)
    }
    
    func _climbStairs(_ n: Int, _ memo: inout [Int]) -> Int {
        if n <= 1 { // 0步或1步的爬法只有1种
            return 1
        } else if n == 2 { // 2步的爬法有: 1+1、 2
            return 2
        } else {
            if memo[n - 1] == 0 {
                memo[n - 1] = _climbStairs(n - 1, &memo)
            }
            if memo[n - 2] == 0 {
                memo[n - 2] = _climbStairs(n - 2, &memo)
            }
            return memo[n - 1] + memo[n - 2]
        }
    }
}

SolutionDP().climbStairs(20)
Solution().climbStairs(20)
