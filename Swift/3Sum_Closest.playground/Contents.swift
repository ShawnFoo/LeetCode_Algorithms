/*
 3Sum Closest
 
 Tag: Array、 Two Pointers
 
 https://leetcode.com/problems/3sum-closest/description/
 */

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 {
            return 0
        }
        var numbers = nums.sorted()
        
        var closestNum = numbers[0] + numbers[1] + numbers[2]
        var i = 0
        while i < numbers.count-2 {
            var front = i + 1
            var end = numbers.count - 1
            let firstNum = numbers[i]
            while front < end {
                let thirdNum = numbers[end]
                let secNum = numbers[front]
                let sum = firstNum + secNum + thirdNum
                // 两数之差小的更接近
                if abs(target - closestNum) > abs(target - sum) {
                    closestNum = sum
                    if closestNum == target {
                        return target
                    }
                }
                if sum > target {
                    end -= 1
                }
                else {
                    front += 1
                }
            }
            while i < numbers.count-2 && firstNum == numbers[i] {
                i += 1
            }
        }
        return closestNum
    }
}

let solution = Solution()
//solution.threeSumClosest([1,1,1,0], -100)
solution.threeSumClosest([0, 2, 1, -3], 1)
