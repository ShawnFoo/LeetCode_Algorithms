import Foundation

/**
 46. Permutations
 
 Tags: Backtracking
 
 https://leetcode.com/problems/permutations/description/
 */

/// 12ms. DFS回溯, 相比于后边的SolutionBacktracking, 减少了反复创建新数组的消耗, 仅用一个数组, 每次把后边一个数交换到当前遍历的位置上来
class SolutionBacktrackingDFS {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count > 1 {
            var mNums = nums
            var results: [[Int]] = []
            backtracking(&mNums, start: 0, &results)
            return results
        }
        return [nums]
    }
    
    private func backtracking(_ nums: inout [Int], start: Int, _ results: inout [[Int]]) {
        if start == nums.count - 1 {
            results.append(nums)
        } else if start < nums.count - 1 {
            for i in start..<nums.count {
                nums.swapAt(start, i)
                backtracking(&nums, start: start + 1, &results)
                nums.swapAt(start, i)
            }
        }
    }
}

/// 回溯递归实现
class SolutionBacktracking {
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

