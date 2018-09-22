import Foundation

/**
 144. Binary Tree Preorder Traversal

 Tags: Stack、Tree
 
 https://leetcode.com/problems/binary-tree-preorder-traversal/description/
 */

/**
 栈实现, 8ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var results: [Int] = []
        var stack: [TreeNode] = []
        var node: TreeNode? = root
        while node != nil || !stack.isEmpty {
            if node != nil {
                results.append(node!.val)
                if let rigth = node!.right {
                    stack.append(rigth)
                }
                node = node!.left
            } else { // stack not empty
                node = stack.popLast()
            }
        }
        return results
    }
}

/**
 递归实现, 8ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionRecursive {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var results: [Int] = []
        recursive(root, &results)
        return results
    }
    
    private func recursive(_ root: TreeNode?, _ results: inout [Int]) {
        if let root = root {
            results.append(root.val)
            recursive(root.left, &results)
            recursive(root.right, &results)
        }
    }
}
