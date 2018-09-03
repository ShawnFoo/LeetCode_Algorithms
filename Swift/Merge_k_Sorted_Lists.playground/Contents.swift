import Foundation

/**
 23. Merge k Sorted Lists
 
 Tags: Linked List、Divide and Conquer、Heap
 
 https://leetcode.com/problems/merge-k-sorted-lists/description/
 */

/**
 HashMap实现, 72ms. 时间复杂度O(2N), 空间复杂度O(n)
 
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

/**
 分治实现, 76ms. 时间复杂度:O(N*Logk), 空间复杂度O(n)
 
 思路: 两个两个进行合并(共log2 k 次), 直至仅剩一个. 相比于每次合并出一个再接着合并的实现(合并后的链表长度不断增加), 分治省去了许多的重复遍历
 
 空间方面, 因为Swift参数为let常量不可修改, 这部分没法优化
 */
class SolutionDC {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        var results = lists
        var temps: [ListNode?] = []
        while results.count > 1 {
            temps.append(contentsOf: results)
            results.removeAll()
            var i = 0
            while i < temps.count {
                if i + 1 < temps.count {
                    results.append(mergeTwoLists(temps[i], temps[i + 1]))
                } else {
                    results.append(temps[i])
                }
                i += 2
            }
            temps.removeAll()
        }
        return results.first!
    }
    
    func mergeTwoLists(_ lhs: ListNode?, _ rhs: ListNode?) -> ListNode? {
        var prevNode: ListNode? = nil
        var lNode = lhs
        var rNode = rhs
        while lNode != nil || rNode != nil {
            if let left = lNode, let right = rNode {
                if left.val <= right.val {
                    prevNode?.next = left
                    prevNode = left
                    lNode = left.next
                } else {
                    prevNode?.next = right
                    prevNode = right
                    rNode = right.next
                }
            } else {
                prevNode?.next = lNode ?? rNode
                break
            }
        }
    
        if lhs != nil && rhs != nil {
            return lhs!.val <= rhs!.val ? lhs : rhs
        } else {
            return lhs != nil ? lhs : rhs
        }
    }
}

var node1 = ListNode(1)
var node2 = ListNode(4)
var node3 = ListNode(5)
var node4 = ListNode(1)
var node5 = ListNode(3)
var node6 = ListNode(4)
var node7 = ListNode(2)
var node8 = ListNode(6)

node1.next = node2
node2.next = node3
node4.next = node5
node5.next = node6
node7.next = node8

let tests = [node1, node4, node7]

SolutionDC().mergeKLists(tests)!
