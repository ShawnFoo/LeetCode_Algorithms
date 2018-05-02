/**
 Merge Two Sorted Lists
 
 Tag: Linked List
 
 https://leetcode.com/problems/merge-two-sorted-lists/description/
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        }
        var head1 = l1
        var head2 = l2
        var headNode: ListNode? = nil
        var tailNode: ListNode? = headNode
        while head1 != nil || head2 != nil {
            if (head1 == nil || head2 == nil) {
                var head = head1 == nil ? head2 : head1
                while head != nil {
                    if (headNode == nil) {
                        headNode = ListNode(head!.val)
                        tailNode = headNode
                    } else {
                        tailNode!.next = ListNode(head!.val)
                        tailNode = tailNode!.next
                    }
                    head = head!.next
                }
                break
            } else {
                var val = 0
                if (head1!.val < head2!.val) {
                    val = head1!.val
                    head1 = head1!.next
                } else {
                    val = head2!.val
                    head2 = head2!.next
                }
                if (headNode == nil) {
                    headNode = ListNode(val)
                    tailNode = headNode
                } else {
                    tailNode!.next = ListNode(val)
                    tailNode = tailNode!.next
                }
            }
        }
        return headNode
    }
}
