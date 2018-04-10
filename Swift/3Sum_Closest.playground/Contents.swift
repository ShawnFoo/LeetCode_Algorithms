/*
 3Sum Closest
 
 Tag: Array、 Two Pointers
 
 https://leetcode.com/problems/3sum-closest/description/
 */


/// 暴力法, 排列组合
class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 {
            return 0
        }
        var numbers = nums.sorted()
    
        var closestNum = numbers[0] + numbers[1] + numbers[2]
        var i = 0
        while i < numbers.count-2 {
            let firstNum = numbers[i]
            var front = i + 1
            while front < numbers.count-1 {
                let secNum = numbers[front]
                var end = numbers.count - 1
                while front < end {
                    let thirdNum = numbers[end]
                    let sum = firstNum + secNum + thirdNum
                    // 两数之差小的更接近
                    let firstDiff = max(closestNum, target) - min(closestNum, target)
                    let secDiff = max(sum, target) - min(sum, target)
                    closestNum = firstDiff < secDiff ? closestNum : sum
                    while front < end && thirdNum == numbers[end] {
                        end -= 1
                    }
                }
                while front < numbers.count-1 && secNum == numbers[front] {
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
