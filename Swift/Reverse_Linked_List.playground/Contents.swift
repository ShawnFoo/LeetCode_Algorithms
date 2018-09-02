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
        var retHead: ListNode? = nil
        var cur = head
        while cur != nil {
            let next = cur!.next
            cur!.next = retHead
            retHead = cur!
            cur = next
        }
        return retHead
    }
}

/**
 递归实现, 20ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionRecursive {
    func reverseList(_ head: ListNode?) -> ListNode? {
        return reverse(head, nil)
    }
    
    private func reverse(_ head: ListNode?, _ prevHead: ListNode?) -> ListNode? {
        if head == nil {
            return prevHead
        }
        let retHead = reverse(head!.next, head!)
        head!.next = prevHead
        return retHead
    }
}

