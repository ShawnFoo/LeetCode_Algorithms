/*
 3Sum
 
 Tags: Array、 Two Pointers
 
 https://leetcode.com/problems/3sum/description/
 */

// 暴力法.. 超时
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var allSum: [[Int]] = []
        if nums.count >= 3 {
            for i in 0..<nums.count-1 {
                for j in i+1..<nums.count {
                    for z in 0..<nums.count where z != i && z != j {
                        if nums[i] + nums[j] + nums[z] == 0 {
                            allSum.append([nums[i], nums[j], nums[z]])
                        }
                    }
                }
            }
        }
        var uniqueSum: [[Int]] = []
        for elemSet in allSum {
            if uniqueSum.index(where: { Set($0) == Set(elemSet) }) == nil {
                uniqueSum.append(elemSet)
            }
        }
        return uniqueSum
    }
}

let solution = Solution()
solution.threeSum([-2,0,1,1,2])
solution.threeSum([0,0,0,0])

