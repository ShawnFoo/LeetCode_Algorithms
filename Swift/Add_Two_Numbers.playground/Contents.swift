/*
 Add Two Numbers
 
 Tag: Linked List、 Math
 
 https://leetcode.com/problems/add-two-numbers/description/
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/**
 思路: 按位加, 处理好满10进1位即可
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var listHead: ListNode?
        var addOneNext = false // 下一位进1
        var listLastNode: ListNode?
        var n1: ListNode? = l1
        var n2: ListNode? = l2
        while n1 != nil || n2 != nil {
            let d1 = n1 != nil ? n1!.val : 0
            let d2 = n2 != nil ? n2!.val : 0
            var digitSum = d1 + d2 + (addOneNext ? 1 : 0) // 对应位置两数相加, 以及进位1
            if n1 != nil {
                n1 = n1!.next
            }
            if n2 != nil {
                n2 = n2!.next
            }
            addOneNext = digitSum >= 10 // 两数相加大于10, 标记下一位进1
            digitSum %= 10
            if let lastNode = listLastNode {
                lastNode.next = ListNode(digitSum)
                listLastNode = lastNode.next
            }
            else { // 头节点
                listHead = ListNode(digitSum)
                listLastNode = listHead
            }
        }
        if (addOneNext) { // 相同长度的两个单向链表 最后位置节点 满10进1
            listLastNode!.next = ListNode(1)
        }
        return listHead
    }
}


