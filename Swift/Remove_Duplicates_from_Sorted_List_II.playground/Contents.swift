import Foundation

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

