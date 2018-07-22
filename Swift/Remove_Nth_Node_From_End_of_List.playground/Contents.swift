import Foundation

/*
 Remove Nth Node From End of List
 
 Tag: Linked List、Two Pointers
 
 https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/
 */

/// 时间复杂度O(n). 思路: 使用Map或Array去记录链表节点顺序及count, 然后删除对应倒叙位置的节点
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var retHead: ListNode? = nil
        if let head = head {
            var nodesDic: [Int: ListNode] = [:]
            var i = 0
            var curNode: ListNode? = head
            while curNode != nil { // 存储链表节点顺序
                nodesDic[i] = curNode!
                i = i + 1
                curNode = curNode?.next
            }
            // Note: Given n will always be valid
            let removeIndex = nodesDic.count - n // 移除位置倒叙转顺序
            if removeIndex == 0 { // 移除头节点
                retHead = head.next
                head.next = nil
            } else { // 其他节点
                retHead = head
                let removeNode = nodesDic[removeIndex]
                let lastNode = nodesDic[removeIndex - 1]
                lastNode?.next = removeNode?.next
                removeNode?.next = nil
            }
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

// test

var head = ListNode(1)
var node1 = ListNode(2)
var node2 = ListNode(3)
var node3 = ListNode(4)
var node4 = ListNode(5)
head.next = node1
node1.next = node2
node2.next = node3
node3.next = node4

let rHead = Solution().removeNthFromEnd(head, 5)
print(rHead!)

