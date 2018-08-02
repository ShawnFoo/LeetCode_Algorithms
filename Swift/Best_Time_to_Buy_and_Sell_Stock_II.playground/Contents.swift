import Foundation

/**
 122. Best Time to Buy and Sell Stock II
 
 Tags: Array、Greedy
 
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/
 */

/**
 时间复杂度: O(n), 空间复杂度: O(1)
 
 思路: 要获得最大利润, 即找差额最大的部分相加. 遍历数组时先找到一个递减序列中的最低价, 然后再
 找到递增序列中的最后一个, 即某段区域的最大利润。
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        var profits = 0
        var i = 0
        while i < prices.count {
            while i < prices.count-1 && prices[i] > prices[i+1] {
                i += 1 // 递减序列中最低价的位置
            }
            var min = prices[i]
            while i < prices.count-1 && prices[i] < prices[i+1] {
                i += 1 // 递增序列中最高价的位置
            }
            profits += prices[i] - min // 差价即最大利润
            i += 1
        }
        return profits
    }
}

/**
 时间复杂度: O(n), 空间复杂度: O(1)
 
 暴力法, 直接计算相邻两个之间的差值, 大于0即为利润. 宏观上看, 每一次利润都积累起来即最大利润
 */
class Solution1 {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        var profits = 0
        for i in 0..<prices.count-1 {
            profits += max(prices[i+1] - prices[i], 0)
        }
        return profits
    }
}

Solution1().maxProfit([7,1,5,3,6,4])
Solution1().maxProfit([3, 3])
Solution1().maxProfit([3])
Solution1().maxProfit([])
