import Foundation

/**
 92. Reverse Linked List II
 
 Tags: Linked List
 
 https://leetcode.com/problems/reverse-linked-list-ii/description/
 */

/**
 双指针实现, 12ms. 时间复杂度O(n), 空间复杂度O(1)
 */
class Solution {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if m == n || head == nil {
            return head
        }
        var index = 1
        var node = head
        var rHead: ListNode? = nil // 翻转区域头结点
        var rTail: ListNode? = nil // 翻转区域尾节点
        var rHeadPrev: ListNode? = nil // 翻转区域前一个节点
        while node != nil && index <= n {
            let nextNode = node!.next
            if index + 1 == m {
                rHeadPrev = node
            } else if index >= m {
                if index == m {
                    rTail = node
                }
                node!.next = rHead
                rHead = node
            }
            index += 1
            node = nextNode
        }
        // 翻转区域前后节点衔接处理
        rHeadPrev?.next = rHead
        rTail?.next = node
        return rHeadPrev != nil ? head : rHead
    }
}
