import Foundation

/**
 121. Best Time to Buy and Sell Stock
 
 Tags: Array、DP
 
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
 */

/**
 kadane算法实现. 时间复杂度O(n), 空间复杂度O(n)
 
 思路用kadane算法求数组中某段区域的最大差值
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        if prices.count > 0 {
            var minPrice = prices.first!
            for i in 1..<prices.count {
                maxProfit = max(maxProfit, prices[i] - minPrice)
                minPrice = min(prices[i], minPrice)
            }
        }
        return maxProfit
    }
}

/**
 暴力法, 时间复杂度O(n^2), 空间复杂度O(1)
 */
class SolutionBF {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        for i in 0..<prices.count {
            for j in i+1..<prices.count {
                maxProfit = max(prices[j] - prices[i], maxProfit)
            }
        }
        return maxProfit
    }
}

Solution().maxProfit([7,1,5,3,6,4])
Solution().maxProfit([7,6,4,3,1])
