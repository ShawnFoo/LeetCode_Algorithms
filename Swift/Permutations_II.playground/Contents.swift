import Foundation

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var used: [Bool] = Array(repeating: false, count: nums.count)
        var combo: [Int] = []
        backtracking(&combo, &used, nums.sorted(), &results)
        return results
    }
    
    private func backtracking(_ combo: inout [Int], _ used: inout [Bool], _ nums: [Int], _ results: inout [[Int]]) {
        if combo.count == nums.count {
            results.append(combo)
        } else {
            var lastIndex = -1
            for i in 0..<nums.count {
                if used[i] {
                    continue
                }
                if lastIndex != -1 && nums[i] == nums[lastIndex] {
                    continue
                }
                used[i] = true
                combo.append(nums[i])
                backtracking(&combo, &used, nums, &results)
                used[i] = false
                combo.removeLast()
                lastIndex = i
            }
        }
    }
}

print("result: \(Solution().permuteUnique([1,1,2]))")
print("result: \(Solution().permuteUnique([2,2,1,1]))")
print("result: \(Solution().permuteUnique([0,1,0,0,9]))")
