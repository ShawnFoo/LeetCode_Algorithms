import Foundation

/**
 103. Binary Tree Zigzag Level Order Traversal
 
 Tags: Tree、Stack、BFS
 
 https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/description/
 */

/**
 基于Queue的BFS实现, 20ms
 */
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var results: [[Int]] = []
        if root != nil {
            // 节点顺序全部为l2r
            var row: [TreeNode] = [root!] // 当前行节点
            var nextRow: [TreeNode] = [] // 下行节点
            var vals: [Int] = [root!.val] // 当前行的节点值
            var reverse = false // 加入结果时, 是否反转
            while !row.isEmpty {
                results.append(reverse ? vals.reversed() : vals) // 隔行反转即可
                vals.removeAll()
                nextRow.removeAll()
                while !row.isEmpty { // 从左到右遍历所有子节点
                    let node = row.removeFirst()
                    if let left = node.left {
                        nextRow.append(left)
                        vals.append(left.val)
                    }
                    if let right = node.right {
                        nextRow.append(right)
                        vals.append(right.val)
                    }
                }
                row = nextRow
                reverse = !reverse
            }
        }
        return results
    }
}
