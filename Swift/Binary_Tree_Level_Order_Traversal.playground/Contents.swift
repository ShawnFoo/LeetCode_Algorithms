import Foundation

/**
 102. Binary Tree Level Order Traversal
 
 Tags: Tree、 BST
 
 https://leetcode.com/problems/binary-tree-level-order-traversal/description/
 */

/**
 bsf实现, 16ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var results: [[Int]] = []
        var temp: [Int] = []
        var queue: [TreeNode] = []
        queue.append(root)
        repeat {
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                temp.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            results.append(temp)
            temp.removeAll()
        } while queue.count > 0
        return results
    }
}

/**
 dsf先序递归实现, 12ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionDSF {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var results: [[Int]] = []
        dsf(root, &results, 0)
        return results
    }
    
    private func dsf(_ root: TreeNode?, _ results: inout [[Int]], _ height: Int) {
        if let root = root {
            if results.count <= height {
                results.append(Array<Int>())
            }
            results[height].append(root.val)
            dsf(root.left, &results, height + 1)
            dsf(root.right, &results, height + 1)
        }
    }
}
