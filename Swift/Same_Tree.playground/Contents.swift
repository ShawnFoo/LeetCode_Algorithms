import Foundation

/**
 100. Same Tree
 
 Tags: Tree、DFS
 
 https://leetcode.com/problems/same-tree/description/
 */

/**
 递归先序遍历, 8ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionRecursive {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        } else if p == nil || q == nil {
            return false
        } else {
            return p!.val == q!.val
                && isSameTree(p!.left, q!.left)
                && isSameTree(p!.right, q!.right)
        }
    }
}

/**
 非递归 先序遍历实现, 12 ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var pStack: [TreeNode] = []
        var qStack: [TreeNode] = []
        
        var pNode = p
        var qNode = q
        while pNode != nil || qNode != nil || pStack.count > 0 || qStack.count > 0 {
            if pNode != nil || qNode != nil {
                if let lhs = pNode, let rhs = qNode {
                    if lhs.val == rhs.val {
                        if lhs.right != nil {
                            qStack.append(lhs.right!)
                        }
                        if rhs.right != nil {
                            pStack.append(rhs.right!)
                        }
                        if pStack.count != qStack.count {
                            return false
                        }
                        pNode = lhs.left
                        qNode = rhs.left
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            } else if pStack.count > 0 || qStack.count > 0 {
                if pStack.count != qStack.count {
                    return false
                } else {
                    pNode = pStack.popLast()
                    qNode = qStack.popLast()
                }
            }
        }
        
        return true
    }
}

/**
 BSF实现, 16ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionBSF {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        } else if p == nil || q == nil {
            return false
        } else {
            var pQueue: [TreeNode] = []
            var qQueue: [TreeNode] = []
            pQueue.append(p!)
            qQueue.append(q!)
            while !pQueue.isEmpty || !qQueue.isEmpty {
                if pQueue.first?.val != qQueue.first?.val {
                    return false
                }
                if pQueue.first!.left != nil {
                    pQueue.append(pQueue.first!.left!)
                }
                if qQueue.first!.left != nil {
                    qQueue.append(qQueue.first!.left!)
                }
                if pQueue.count != qQueue.count {
                    return false
                }
                if pQueue.first!.right != nil {
                    pQueue.append(pQueue.first!.right!)
                }
                if qQueue.first!.right != nil {
                    qQueue.append(qQueue.first!.right!)
                }
                if pQueue.count != qQueue.count {
                    return false
                }
                pQueue.removeFirst()
                qQueue.removeFirst()
            }
            return true
        }
    }
}
