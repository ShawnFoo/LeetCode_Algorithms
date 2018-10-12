import Foundation

/**
 112. Path Sum
 
 Tags: Tree、DPS
 
 https://leetcode.com/problems/path-sum/description/
 */

/**
 DPS实现, 52ms
 */
class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        var exists = false
        dps(root, &exists, 0, sum)
        return exists
    }
    
    private func dps(_ node: TreeNode?, _ results: inout Bool, _ toSum: Int, _ target: Int) {
        if let node = node {
            let sum = toSum + node.val
            if node.left == nil && node.right == nil {
                results = sum == target
            } else {
                dps(node.left, &results, sum, target)
                if !results {
                    dps(node.right, &results, sum, target)
                }
            }
        }
    }
}

/**
 递归实现, 56ms
 */
class SolutionRecursive {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        let remains = sum - root.val
        if root.left == nil && root.right == nil && remains == 0 {
            return true
        }
        return hasPathSum(root.left, remains) || hasPathSum(root.right, remains)
    }
}
