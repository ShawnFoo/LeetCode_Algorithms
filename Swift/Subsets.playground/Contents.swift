import Foundation

/**
 78. Subsets
 
 Tags:
 
 https://leetcode.com/problems/subsets/description/
 */

/**
 暴力回溯实现. 20ms
 
 思路: 将求所有长度子集的问题拆分为求指定长度的子集. 再将所有子集合并起来即为结果.
 
 但是, 效率很低, 因为求长度为n的子集时, 没有利用上长度为n-1的子集的结果. 而是每次都重新组合一遍
 */
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var combo: [Int] = []
        var results: [[Int]] = []
        for limit in 0...nums.count { // 求长度为limit的所有不重复子集
            backtrack(limit, 0, &combo, &results, nums)
        }
        return results
    }
    
    /// 求长度为limit的所有不重复子集. start为开始组合的位置
    private func backtrack(_ limit: Int, _ start: Int, _ combo: inout [Int], _ results: inout [[Int]], _ nums: [Int]) {
        if limit == combo.count {
            results.append(combo)
        } else if combo.count < limit // 当前尝试的组合长度小于限制limit
            && (combo.count + nums.count - start) >= limit  {
            // 且已有组合的长度 + 当前start位置在内的剩余个数 可以凑成长度limit的子集
            for i in start..<nums.count {
                combo.append(nums[i])
                // 当前元素用过后, 不再使用, 便不会产生重复子集. 故i+1
                backtrack(limit, i + 1, &combo, &results, nums)
                combo.removeLast()
            }
        }
    }
}

print(Solution().subsets([1,2,3]))
