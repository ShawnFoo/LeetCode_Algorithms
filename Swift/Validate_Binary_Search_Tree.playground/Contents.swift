import Foundation

/**
 98. Validate Binary Search Tree
 
 Tags: Tree, DSF
 
 https://leetcode.com/problems/validate-binary-search-tree/description/
 */

/**
 递归dsf中序实现, 28ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionRecursive {
    func isValidBST(_ root: TreeNode?) -> Bool {
        var prevNode: TreeNode? = nil
        return dsf(root, &prevNode)
    }
    
    private func dsf(_ node: TreeNode?, _ prevNode: inout TreeNode?) -> Bool {
        guard let node = node else {
            return true
        }
        var isValid = dsf(node.left, &prevNode)
        if let prevNode = prevNode, prevNode.val >= node.val {
            return false
        }
        prevNode = node
        if isValid {
            isValid = dsf(node.right, &prevNode)
        }
        return isValid
    }
}

/**
 dsf中序遍历非递归实现, 32ms. 时间复杂度O(n), 空间复杂度O(n)
 
 相比于递归多了4ms. 使用stack还需处理好叶子节点的额外出栈入栈操作.
 */
class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        var stack: [TreeNode] = []
        var prevNode: TreeNode? = nil
        var node: TreeNode? = root
        while node != nil || stack.count > 0 {
            if node != nil {
                stack.append(node!)
                node = node!.left
            } else {
                node = stack.popLast()
                if let prevNode = prevNode, prevNode.val >= node!.val {
                    return false
                }
                prevNode = node
                node = node!.right
            }
        }
        return true
    }
}

