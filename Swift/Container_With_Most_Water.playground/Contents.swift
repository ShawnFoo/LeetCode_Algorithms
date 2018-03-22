/*
 Container With Most Water
 
 Tags: Array、Two Pointers
 
 https://leetcode.com/problems/container-with-most-water/description/
 
 思路: 该题主要是求不可倾斜的容器 最大盛水体积. 即求 两个坐标位置的`X轴间距`与两者之间`矮的Y轴高度` 最大乘积
 
 暴力法直接双循环O(n2)复杂度.
 
 但可以通过从两头向中心遍历一次 达到O(n)的时间复杂度.
 */

class Solution {
    /**
     两头向中心遍历的过程中, 我们要尽量找到 两个最大的高度. 这样才能保证容器的高数值越大.
     高越大, 遍历过程中, 宽会不断变小, 遍历期间则可以把当前宽度下, 两头的次高 求得乘积. 不断更新最大乘积则获得结果
     */
    func maxArea(_ height: [Int]) -> Int {
        var start = 0               // 头指针
        var end = height.count - 1  // 尾指针
        var area = 0
        while end > start {
            let minHeight = min(height[start], height[end]) // 取两者之间矮的作为容器的高
            area = max(area, (end - start) * minHeight);    // 两者X轴间距 为宽
            if height[start] < height[end] { // 末尾更高, 则头指针右移
                start += 1
            }
            else { // 反之 左移
                end -= 1
            }
        }
        return area;
    }
}
