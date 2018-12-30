import Foundation

/**
 111. Minimum Depth of Binary Tree
 
 Tags: Tree、DFS、BFS
 
 https://leetcode.com/problems/minimum-depth-of-binary-tree/description/
 */

/**
 BFS实现, 48ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionBFS {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        } else {
            var levelNodes = [root!]
            var depth = 0
            while !levelNodes.isEmpty {
                depth += 1
                
                let lastLevelNodes = levelNodes
                levelNodes.removeAll()
                for node in lastLevelNodes {
                    if node.left == nil && node.right == nil { // 发现leaf节点
                        return depth
                    }
                    if let left = node.left {
                        levelNodes.append(left)
                    }
                    if let right = node.right {
                        levelNodes.append(right)
                    }
                }
            }
            return depth
        }
    }
}


/**
 DFS递归实现, 84ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionDFSRecursive {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        if root.left == nil && root.right == nil {
            return 1
        } else if let left = root.left, let right = root.right {
            return min(minDepth(left), minDepth(right)) + 1
        } else {
            return (root.left != nil ? minDepth(root.left) : minDepth(root.right)) + 1
        }
    }
}
