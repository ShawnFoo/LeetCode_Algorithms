import Foundation

/**
 107. Binary Tree Level Order Traversal II
 
 Tags: Tree、BFS
 
 https://leetcode.com/problems/binary-tree-level-order-traversal-ii/description/
 */

/**
 BFS实现, 20ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var levelVals: [[Int]] = []
        var levelVal: [Int] = [root.val]
        
        var level: [TreeNode] = [root]
        while !level.isEmpty  {
            let lastLevel = level
            levelVals.append(levelVal)
            levelVal.removeAll()
            level.removeAll()
            for node in lastLevel {
                if let left = node.left {
                    levelVal.append(left.val)
                    level.append(left)
                }
                if let right = node.right {
                    levelVal.append(right.val)
                    level.append(right)
                }
            }
        }
        return levelVals.reversed()
    }
}
