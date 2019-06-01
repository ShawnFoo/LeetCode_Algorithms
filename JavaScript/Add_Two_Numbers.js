/**
 * 2. Add Two Numbers
 * 
 * Tags: Linked List、Math
 * 
 * https://leetcode.com/problems/add-two-numbers/description/
 */

function ListNode(val) {
    this.val = val;
    this.next = null;
};

// 104ms, O(Max(N, M))
var addTwoNumbers = function(l1, l2) {
    let head = null;
    if (l1 !== null && l2 !== null) {
        let n1 = l1;
        let n2 = l2;
        let tail = null;
        let addOne = false;
        let sum = 0;
        while (n1 !== null || n2 !== null) {
            if (n1 !== null && n2 !== null) {
                sum = n1.val + n2.val + addOne;
            } else {
                sum = (n1 ? n1.val : n2.val) + addOne;
            }
            addOne = sum > 9;
            sum %= 10;
            
            n1 = n1 ? n1.next : null;
            n2 = n2 ? n2.next : null;
            if (head === null) {
                head = new ListNode(sum);
                tail = head;
            } else {
                tail.next = new ListNode(sum);
                tail = tail.next;
            }
        }
        if (addOne) {
            tail.next = new ListNode(1);
        }
    }
    return head;
};