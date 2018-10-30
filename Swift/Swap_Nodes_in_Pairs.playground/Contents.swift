import Foundation

/*
 Swap Nodes in Pairs
 
 Tag: Linked List
 
 https://leetcode.com/problems/swap-nodes-in-pairs/description/
 */

/**
 基本反转链表通用实现, 16ms.
 
 思路: 分治, 拆分为特定长度的某段子链表进行反转, 再pairs相连合并即可
 */
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let kLength = 2 // 反转长度
        let result = reverseList(head, kLength)
        if result.tail == nil {
            return result.head
        } else {
            let retHead = result.head
            var lastResult = result
            while lastResult.tail != nil {
                let result = reverseList(lastResult.tail!.next, kLength)
                lastResult.tail!.next = result.head
                lastResult = result
            }
            return retHead
        }
    }

    private func reverseList(_ head: ListNode?, _ length: Int) -> (head: ListNode?, tail: ListNode?) {
        if head == nil || head!.next == nil {
            return (head: head, tail: nil)
        }
        
        var retHead = head
        var limit = length - 1
        while limit > 0 && head!.next != nil {
            let next = head!.next
            head!.next = next!.next
            next!.next = retHead
            retHead = next
            
            limit -= 1
        }
        
        return (head: retHead, tail: head)
    }
}

/// 递归实现. 思路: 每两个节点为一对进行调换, 并指向后续一对节点调换后的前节点, 直至最后仅剩下一个节点或为空
class Solution1 {
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

/// 12ms. 思路: 双指针顺序遍历替换
class Solution2 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil {
            return head
        }
        let retHead = head!.next
        var tail: ListNode? = nil // 上对pairs的tail
        var cur = head
        while cur?.next != nil {
            let next = cur!.next
            let nextHead = next?.next
            // pairs相连
            tail?.next = next
            // pairs转换
            next?.next = cur
            cur!.next = nextHead
            // tail记录, 移至下一对
            tail = cur
            cur = nextHead
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

