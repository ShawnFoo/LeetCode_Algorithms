import Foundation

/**
 83. Remove Duplicates from Sorted List
 
 Tags: Linked List
 
 https://leetcode.com/problems/remove-duplicates-from-sorted-list/description/
 */

/// 非递归实现, 32ms. 时间复杂度O(n), 空间复杂度O(1)
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var curNode = head
        while curNode != nil {
            if curNode!.val == curNode!.next?.val { // 下个节点值重复, 跳过
                curNode!.next = curNode!.next!.next
            } else {
                curNode = curNode!.next
            }
        }
        return head
    }
}

/// 递归倒序遍历实现, 32ms. 时间复杂度O(n), 空间复杂度O(n)
class SolutionRecursive {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil {
            return head
        }
        head!.next = deleteDuplicates(head!.next)
        return head!.val == head!.next?.val ? head!.next : head!
    }
}

/**
 双指针+哈希表的通用实现(无序或有序), 32ms. 时间复杂度O(n), 空间复杂度O(n)
 */
class SolutionUniversal {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var values = Set<Int>()
        var curNode = head
        var prevNode: ListNode? = nil
        while curNode != nil {
            if values.contains(curNode!.val) { // 已存在跳过
                prevNode!.next = curNode!.next
                curNode = prevNode!.next
            } else { // 否则更新当前节点
                values.insert(curNode!.val)
                prevNode = curNode
                curNode = curNode!.next
            }
        }
        return head
    }
}
