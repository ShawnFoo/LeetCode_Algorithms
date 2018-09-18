import Foundation

/**
 100. Same Tree
 
 Tags: Tree、DFS
 
 https://leetcode.com/problems/same-tree/description/
 */

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
                        var count = 0
                        if lhs.right != nil {
                            qStack.append(lhs.right!)
                            count += 1
                        }
                        if rhs.right != nil {
                            pStack.append(rhs.right!)
                            count += 1
                        }
                        if count != 2 && count != 0 {
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
 递归先序遍历, 12ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionRecursive {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        } else if p == nil || q == nil {
            return false
        } else {
            var isSame = p!.val == q!.val
            if isSame {
                isSame = isSameTree(p!.left, q!.left)
                if isSame {
                    isSame = isSameTree(p!.right, q!.right)
                }
            }
            return isSame
        }
    }
}
