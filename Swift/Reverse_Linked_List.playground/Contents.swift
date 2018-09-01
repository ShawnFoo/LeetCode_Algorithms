import Foundation

/**
 206. Reverse Linked List
 
 Tags: Linked List
 
 https://leetcode.com/problems/reverse-linked-list/description/
 */

/**
 双指针实现, 16ms. 时间复杂度O(n), 空间复杂度O(1)
 */
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var retHead = head
        var cur = head
        while cur != nil && cur!.next != nil {
            let prev = retHead
            let next = cur!.next
            let nextNext = next?.next
            retHead = next
            retHead?.next = prev
            head!.next = nextNext // head就是tail节点
            cur = head
        }
        return retHead
    }
}

/**
 递归实现, 20ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionRecursive {
    func reverseList(_ head: ListNode?) -> ListNode? {
        return reverse(head).retHead
    }
    
    private func reverse(_ head: ListNode?) -> (retHead: ListNode?, prevNode: ListNode?) {
        if head == nil || head!.next == nil {
            return (head, head)
        }
        let stackFrame = reverse(head!.next)
        stackFrame.prevNode?.next = head!
        head!.next = nil
        return (retHead: stackFrame.retHead, prevNode: head!)
    }
}

