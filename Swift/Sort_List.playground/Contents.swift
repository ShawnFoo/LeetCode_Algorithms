import Foundation

/**
 148. Sort List
 
 Tags: Linked List、Sort
 
 https://leetcode.com/problems/sort-list/description/
 */

/**
 分治实现(merge sort), 288ms. 时间复杂度O(nLogn)
 */
class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil {
            return head
        }
        // 先分
        var prev: ListNode? = nil
        var slow = head
        var fast = head
        while fast?.next != nil { // 双指针查找分的位置
            prev = slow
            slow = slow!.next
            fast = fast!.next!.next
        }
        prev!.next = nil // 前半部分的tail置空
        
        // 后合
        return mergeList(sortList(head), sortList(slow))
    }
    
    func mergeList(_ lList: ListNode?, _ rList: ListNode?) -> ListNode? {
        var head = ListNode(0)
        var tail = head
        var l = lList
        var r = rList
        
        while l != nil && r != nil {
            if l!.val < r!.val {
                tail.next = l
                tail = l!
                l = l!.next
            } else {
                tail.next = r
                tail = r!
                r = r!.next
            }
        }
        
        if l != nil || r != nil {
            tail.next = l != nil ? l : r
        }
        
        return head.next
    }
}
