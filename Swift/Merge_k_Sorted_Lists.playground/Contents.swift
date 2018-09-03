import Foundation

/**
 23. Merge k Sorted Lists
 
 Tags: Linked List、Divide and Conquer、Heap
 
 https://leetcode.com/problems/merge-k-sorted-lists/description/
 */

/**
 HashMap实现, 72ms.
 
 思路: 基于解决hash冲突的链地址法. 节点val作为key, 后边值冲突的节点将追加在上一个同值节点的后边
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var map: [Int: [ListNode]] = [:]
        for i in 0..<lists.count {
            var node = lists[i]
            while node != nil {
                let value = node!.val
                if map[value] == nil {
                    map[value] = [node!]
                } else {
                    map[value]!.last!.next = node!
                    map[value]!.append(node!)
                }
                node = node!.next
            }
        }
        var retHead: ListNode? = nil
        var prevNode: ListNode? = nil
        for i in map.keys.sorted() {
            let nodes = map[i]!
            if retHead == nil {
                retHead = nodes.first!
                prevNode = nodes.last!
            } else {
                prevNode!.next = nodes.first!
                prevNode = nodes.last!
            }
        }
        return retHead
    }
}
