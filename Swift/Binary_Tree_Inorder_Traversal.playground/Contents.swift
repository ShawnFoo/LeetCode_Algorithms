import Foundation

/**
 94. Binary Tree Inorder Traversal
 
 Tags: Hash Table、Stack、Tree
 
 https://leetcode.com/problems/binary-tree-inorder-traversal/description/
 */

/// 递归实现. Runtime: 12ms
class SolutionRecursive {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        _inorderTraversal(root, &result)
        return result
    }
    
    private func _inorderTraversal(_ node: TreeNode?, _ result: inout [Int]) {
        if let node = node {
            _inorderTraversal(node.left, &result)
            result.append(node.val)
            _inorderTraversal(node.right, &result)
        }
    }
}

/// 用栈模拟递归调用先后顺序实现. Runtime: 16ms
class SolutionStack {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack: [TreeNode] = []
        var curNode = root
        while !stack.isEmpty || curNode != nil {
            if curNode == nil {
                // 叶子节点遍历完了, 出栈
                curNode = stack.popLast()
            } else if let left = curNode?.left {
                stack.append(curNode!)
                curNode = left
                continue
            }
            if curNode != nil {
                // 输出当前节点后接着遍历右节点
                result.append(curNode!.val)
                curNode = curNode!.right
            }
        }
        return result
    }
}
