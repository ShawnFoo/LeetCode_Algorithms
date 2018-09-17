import Foundation

/**
 100. Same Tree
 
 Tags: Tree、DFS
 
 https://leetcode.com/problems/same-tree/description/
 */

/**
 递归先序遍历, 12ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionRecursive {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        } else if p == nil || q == nil {
            return false
        } else {
            var isSame = p!.val == q!.val
            if isSame {
                isSame = isSameTree(p!.left, q!.left)
                if isSame {
                    isSame = isSameTree(p!.right, q!.right)
                }
            }
            return isSame
        }
    }
}
