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

/**
 队列BFS实现, 24ms
 
 思路: 注意入队顺序, 左右子树方向相反即可
 */
class SolutionBFS {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if let root = root {
            var leftQueue: [TreeNode] = []
            var rightQueue: [TreeNode] = []
            var leftNode = root.left
            var rightNode = root.right
            while leftNode != nil && rightNode != nil || !leftQueue.isEmpty && !rightQueue.isEmpty {
                if let left = leftNode, let right = rightNode {
                    if left.val == right.val {
                        if left.left != nil && right.right != nil {
                            leftQueue.append(left.left!)
                            rightQueue.append(right.right!)
                        } else if left.left != nil || right.right != nil {
                            return false
                        }
                        if left.right != nil && right.left != nil {
                            leftQueue.append(left.right!)
                            rightQueue.append(right.left!)
                        } else if left.right != nil || right.left != nil {
                            return false
                        }
                        leftNode = nil
                        rightNode = nil
                    } else {
                        return false
                    }
                } else {
                    leftNode = leftQueue.removeFirst()
                    rightNode = rightQueue.removeFirst()
                }
            }
            return leftNode == nil && rightNode == nil && leftQueue.isEmpty && rightQueue.isEmpty
        }
        return true
    }
}
