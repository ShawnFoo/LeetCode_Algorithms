/**
 104. Maximum Depth of Binary Tree
 
 Tags: Tree、DSF
 
 https://leetcode.com/problems/maximum-depth-of-binary-tree/description/
 */

import Foundation

/**
 dfs递归实现, 24ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        return root == nil ? 0 : max(maxDepth(root!.left), maxDepth(root!.right)) + 1
    }
}

/**
 bfs实现, 52ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionBSF {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var depth = 0
        var queue: [TreeNode] = []
        queue.append(root)
        repeat {
            depth += 1
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        } while queue.count > 0
        return depth
    }
}
