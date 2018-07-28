import Foundation

/**
 Permutations
 
 Tags: Backtracking
 
 https://leetcode.com/problems/permutations/description/
 */

/// 常规排列组合递归实现版
class SolutionRecursive {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count > 1 {
            var result: [[Int]] = []
            _permute([], nums, &result)
            return result
        }
        return [nums]
    }
    
    /// 生成所有不重复的排列组合
    ///
    /// - Parameters:
    ///   - nums: 已排列的数的Array
    ///   - remains: 剩余未排列的数的Array
    ///   - result: 排列完的结果数组
    private func _permute(_ nums: [Int], _ remains: [Int], _ result: inout [[Int]]) {
        if remains.count == 0 {
            result.append(nums)
        } else {
            for i in 0..<remains.count {
                var toNums = nums
                toNums.append(remains[i])
                var toRemains = remains
                toRemains.remove(at: i)
                _permute(toNums, toRemains, &result)
            }
        }
    }
}

/// 回溯递归实现
class SolutionBacktracing {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count > 1 {
            var result: [[Int]] = []
            _permute([], nums, &result)
            return result
        }
        return [nums]
    }

    private func _permute(_ arr: [Int], _ nums: [Int], _ result: inout [[Int]]) {
        if arr.count == nums.count {
            result.append(arr)
        } else {
            for value in nums {
                var toArr = arr
                if toArr.contains(value) {
                    continue
                } else {
                    toArr.append(value)
                    _permute(toArr, nums, &result)
                }
            }
        }
    }
}
