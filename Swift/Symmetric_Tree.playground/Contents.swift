import Foundation

/**
 101. Symmetric Tree
 
 Tags: Tree、DFS、BFS
 
 https://leetcode.com/problems/symmetric-tree/description/
 */

/**
 递归dfs实现, 16ms. 时间复杂度O(n/2-1), 空间复杂度O(n)
 
 思路: 左右子树上的节点同时对称遍历
 */
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return recursive(root?.left, root?.right)
    }
    
    private func recursive(_ lhs: TreeNode?, _ rhs: TreeNode?) -> Bool {
        var isSame = lhs?.val == rhs?.val
        if isSame && (lhs?.left != nil || rhs?.right != nil) {
            isSame = recursive(lhs?.left, rhs?.right)
        }
        if isSame && (lhs?.right != nil || rhs?.right != nil) {
            isSame = recursive(lhs?.right, rhs?.left)
        }
        return isSame
    }
}

class SolutionBSF {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return recursive(root?.left, root?.right)
    }
    
    private func recursive(_ lhs: TreeNode?, _ rhs: TreeNode?) -> Bool {
        var isSame = lhs?.val == rhs?.val
        if isSame && (lhs?.left != nil || rhs?.right != nil) {
            isSame = recursive(lhs?.left, rhs?.right)
        }
        if isSame && (lhs?.right != nil || rhs?.right != nil) {
            isSame = recursive(lhs?.right, rhs?.left)
        }
        return isSame
    }
}
