import Foundation

/**
 55. Jump Game
 
 Tags: Array、Greedy
 
 https://leetcode.com/problems/jump-game/description/
 */

// 暴力法. 时间复杂O(n). 遍历每种情况, 不断找出当前移动范围内, 位置+可移动步数最多的新位置
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 0 {
            return false
        } else if nums.count == 1 {
            return true
        }
        
        var i = 0
        var steps = nums[0]
        while i < nums.count {
            var toIndex = i
            var toSteps = steps
            if steps > 0 {
                // 找到当前范围内 '最靠后'且'可跳距离最长'的位置
                for moveLength in 1...steps {
                    let moveTo = moveLength + i
                    if moveTo > nums.count - 1 {
                        return true
                    }
                    if moveTo + nums[moveTo] >= toIndex + toSteps {
                        toIndex = moveTo
                        toSteps = nums[moveTo]
                        if toIndex + toSteps >= nums.count - 1 {
                            return true
                        }
                    }
                }
            }
            if toIndex == i && toIndex < nums.count - 1 { // 停滞
                break
            }
            i = toIndex
            steps = toSteps
        }
        return false
    }
}

//Solution().canJump([2,3,1,1,4])
//Solution().canJump([3,2,1,0,4])
//Solution().canJump([0])
//Solution().canJump([1])
//Solution().canJump([2, 0, 0])

