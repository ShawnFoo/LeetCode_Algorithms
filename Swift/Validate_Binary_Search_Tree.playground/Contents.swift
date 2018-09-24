import Foundation

/**
 98. Validate Binary Search Tree
 
 https://leetcode.com/problems/validate-binary-search-tree/description/
 */

//class Solution {
//    func isValidBST(_ root: TreeNode?) -> Bool {
//        if let root = root {
//            var leftValid = isValidBST(root.left)
//            if leftValid, let left = root.left {
//                leftValid = root.val > left.val
//            }
//            if !leftValid {
//                return false
//            }
//            var rightValid = isValidBST(root.right)
//            if rightValid, let right = root.right {
//                rightValid = root.val < right.val
//            }
//            if !rightValid {
//                return false
//            }
//        }
//        return true
//    }
//}

/**
 dsf暴力实现, 48ms. 时间复杂度O(2n), 空间复杂度O(n)
 
 思路: 先dsf遍历出节点数组, 再判断数组是否有序.
 */
class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        if let root = root {
            var nodes: [TreeNode] = []
            dsf(root, &nodes)
            for i in 0..<nodes.count-1 {
                if nodes[i].val >= nodes[i+1].val {
                    return false
                }
            }
        }
        return true
    }
    
    private func dsf(_ root: TreeNode?, _ nodes: inout [TreeNode]) {
        if let root = root {
            dsf(root.left, &nodes)
            nodes.append(root)
            dsf(root.right, &nodes)
        }
    }
}

