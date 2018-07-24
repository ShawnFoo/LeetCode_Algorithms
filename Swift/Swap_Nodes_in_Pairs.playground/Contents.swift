import Foundation

/*
 Swap Nodes in Pairs
 
 Tag: Linked List
 
 https://leetcode.com/problems/swap-nodes-in-pairs/description/
 */

/// 递归实现. 思路: 每两个节点为一对进行调换, 并指向后续一对节点调换后的前节点, 直至最后仅剩下一个节点或为空
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if let aheadNode = head, let behindNode = head?.next {
            let nextHead = behindNode.next
            behindNode.next = aheadNode
            aheadNode.next = swapPairs(nextHead)
            return behindNode
        }
        return head
    }
}

/// 思路: 双指针顺序遍历替换
class Solution1 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var retHead = head
        var curNode = head // 当前遍历位置节点
        var tailNode: ListNode? = nil // 新列表的尾节点
        while curNode != nil { // 两两遍历
            let aheadNode = curNode
            let behindNode = curNode?.next
            if aheadNode === head && head?.next != nil { // 头结点更新
                retHead = head?.next
            }
            // 遍历位置更新
            curNode = curNode?.next?.next
            // 尾节点追加当前换位的节点. 若仅剩一个节点则指向前边那个
            tailNode?.next = behindNode ?? aheadNode
            // 后边指向前边
            behindNode?.next = aheadNode
            
            // 尾节点更新
            tailNode = aheadNode
            tailNode?.next = nil
        }
        return retHead
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var desc = "\(val)"
        var node: ListNode? = next
        while node != nil {
            desc += " -> \(node!.val)"
            node = node?.next
        }
        return desc
    }
}

var node = ListNode(1)
var node1 = ListNode(2)
var node2 = ListNode(3)
var node3 = ListNode(4)
var node4 = ListNode(5)
node.next = node1
node1.next = node2
node2.next = node3
node3.next = node4

