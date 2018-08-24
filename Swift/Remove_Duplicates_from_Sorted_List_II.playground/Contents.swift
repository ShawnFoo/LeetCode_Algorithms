import Foundation

/**
 82. Remove Duplicates from Sorted List II
 
 Tags: Linked List
 
 https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/discuss/28339/My-Recursive-Java-Solution
 */

/**
 Two Pointer实现, 28ms. 时间复杂度O(n), 空间复杂度O(1)
 */
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var retHead = head
        var curNode = head
        var prevNode: ListNode? = nil
        while curNode != nil {
            var hasDuplicates = false // 是否存在相邻重复值
            var nextNode = curNode!.next // 下个唯一数值的节点
            while curNode!.val == nextNode?.val { // 跳过所有与当前Node.val相等的节点
                hasDuplicates = true
                nextNode = nextNode!.next
            }
            if hasDuplicates {
                if curNode === retHead { // 更新头结点
                    retHead = nextNode
                }
                curNode = nextNode
                prevNode?.next = nextNode
            } else {
                prevNode = curNode!
                curNode = nextNode
            }
        }
        return retHead
    }
}

/**
 递归实现, 28ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionRecursive {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil {
            return head
        }
        let headVal = head!.val
        var retHead = head
        var next: ListNode? = head!.next
        var hasDuplicate = false
        while next?.val == headVal {
            hasDuplicate = true
            retHead = next!.next
            next = next!.next
        }
        if hasDuplicate { // 与前头节点值相同的跳过
            return deleteDuplicates(retHead)
        } else {
            retHead?.next = deleteDuplicates(retHead?.next)
            return retHead
        }
    }
}

