import Foundation

/*
 Swap Nodes in Pairs
 
 Tag: Linked List
 
 https://leetcode.com/problems/swap-nodes-in-pairs/description/
 */

/// 思路: 双指针顺序遍历替换
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var retHead = head
        var curNode = head // 当前遍历位置节点
        var tailNode: ListNode? = nil // 新列表的尾节点
        while curNode != nil { // 两两遍历
            var aheadNode = curNode
            var behindNode = curNode?.next
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
