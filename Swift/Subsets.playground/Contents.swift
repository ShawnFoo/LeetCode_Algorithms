import Foundation

/**
 78. Subsets
 
 Tags: Array、Backtrcking、Bit Manipulation
 
 https://leetcode.com/problems/subsets/description/
 */

/**
 回溯实现. 12ms

 相比于下方的Solution1、2. 该实现从第一个元素起, 每次排列出当前元素与剩余元素所有不同长度的组合. 再继续排列剩余的每一个元素与其之后元素的组合
 */
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var combo: [Int] = []
        backtracking(0, nums, &combo, &results)
        return results
    }
    
    private func backtracking(_ start: Int, _ nums: [Int], _ combo: inout [Int], _ results: inout [[Int]]) {
        results.append(combo)
        for i in start..<nums.count {
            combo.append(nums[i])
            backtracking(i + 1, nums, &combo, &results)
            combo.removeLast()
        }
    }
}

/**
 基于Solution1暴力回溯实现的改进版. 12ms
 
 主要解决Solution1中重复生成了相同的子集的问题, 即"求长度为n的数组子集时, 没有利用上一次求长度n-1数组子集的结果"的问题
 
 同样还是将求各个长度的数组子集问题拆分成求特定(0~nums.count)长度的子集的所有结果, 每次利用上一次的子集去进行组合.节省重复组合的时间
 
 比如nums为[1, 2, 3], 长度为3, 那么其子集长度的种类包含长度为0、1、2、3的子集, 0~nums.count
 */
class Solution2 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = [[]] // 默认结果为空集
        var lastResults: [[Int]] = results
        for _ in 0..<nums.count { // 求不同长度的不重复子集. 第n次的结果基于第n-1次的结果上进行组合
            let temp = lastResults
            lastResults.removeAll()
            _subsets(temp, &lastResults, nums)
            results.append(contentsOf: lastResults) // 合并当前长度的所有子集
        }
        return results
    }
    
    private func _subsets(_ lastResults: [[Int]], _ results: inout [[Int]], _ nums: [Int]) {
        for combo in lastResults {
            var toCombo = combo
            var endIndex = toCombo.count == 0 ? -1 : -2 // -1为空集, -2为需要查找最后元素出现的位置
            for i in 0..<nums.count {
                if endIndex == -2 { // 先找到combo组合最后1个元素出现的位置
                    if nums[i] == toCombo.last! {
                        endIndex = i
                    }
                } else if endIndex < nums.count - 1 { // 取combo组合尾元素在nums位置中排后面的元素, 逐个组合成新的组合
                    toCombo.append(nums[i])
                    results.append(toCombo)
                    toCombo.removeLast()
                }
            }
        }
    }
}

/**
 暴力回溯实现. 20ms
 
 思路: 将求所有长度子集的问题拆分为求指定长度的子集. 再将所有子集合并起来即为结果.
 
 求特定长度的不重复子集时, 从第一个元素起, 每次仅与后边的元素进行组合, 即不会产生包含重复元素的子集
 
 但是该实现效率很低, 因为求长度为n的子集时, 没有利用上长度为n-1的子集的结果. 而是每次都重新组合一遍
 */
class Solution1 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var combo: [Int] = []
        var results: [[Int]] = []
        for limit in 0...nums.count { // 求长度为limit的所有不重复子集
            backtracking(limit, 0, &combo, &results, nums)
        }
        return results
    }
    
    /// 求长度为limit的所有不重复子集. start为开始组合的位置
    private func backtracking(_ limit: Int, _ start: Int, _ combo: inout [Int], _ results: inout [[Int]], _ nums: [Int]) {
        if limit == combo.count {
            results.append(combo)
        } else if combo.count < limit // 当前尝试的组合长度小于限制limit
            && (combo.count + nums.count - start) >= limit  {
            // 且已有组合的长度 + 当前start位置在内的剩余个数 可以凑成长度limit的子集
            for i in start..<nums.count {
                combo.append(nums[i])
                // 当前元素用过后, 不再使用, 便不会产生重复子集. 故i+1
                backtracking(limit, i + 1, &combo, &results, nums)
                combo.removeLast()
            }
        }
    }
}

print(Solution().subsets([1]))
print(Solution().subsets([1,2,3]))
