import Foundation

/**
 48. Rotate Image
 
 Tags: Array
 
 https://leetcode.com/problems/rotate-image/description/
 
 要求: nxn的矩阵顺时针旋转90度, 直接在原数组内修改, 空间上不可申明一个nxn的二维数组
 */

/**
 时间复杂度: O(n), 空间复杂度: O(n)
 
 思路: 从外圈到内圈逐行每个位置上的4个元素进行单独的旋转替换
 */
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count - 1
        let circles = matrix.count / 2 // 需要旋转的圈数
        var circle = 0 // 当前旋转的圈号. 圈内首元素(circle, circle)
        while circle < circles {
            let lastElemIndex = matrix.count - circle - 1 // 该圈顶部那一行最后1个元素
            var elemIndex = circle
            while elemIndex < lastElemIndex {
                // 每个位置旋转对应的4个元素
                let firstElem = matrix[circle][elemIndex]
                matrix[circle][elemIndex] = matrix[n-elemIndex][circle]
                matrix[n-elemIndex][circle] = matrix[n-circle][n-elemIndex]
                matrix[n-circle][n-elemIndex] = matrix[elemIndex][n-circle]
                matrix[elemIndex][n-circle] = firstElem
                elemIndex += 1
            }
            circle += 1
        }
    }
}

var image = [
    [ 5, 1, 9,11],
    [ 2, 4, 8,10],
    [13, 3, 6, 7],
    [15,14,12,16]
]
Solution().rotate(&image)
