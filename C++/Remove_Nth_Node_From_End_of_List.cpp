/**
19. Remove Nth Node From End of List

Tags: Linked List、Two Pointer

https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/
*/

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

/**
双指针实现, 4ms. 时间复杂度O(n), 空间复杂度O(1)

思路: 前指针照常从头遍历, 后指针延迟n个才开始从头遍历, 当前指针遍历完后尾节点后, 后指针刚好就是倒数第n个节点
*/
class Solution {
public:
    ListNode* removeNthFromEnd(ListNode* head, int n) {
        if (!head) {
            return head;
        }

        int i = 0;
        ListNode *front = head;
        ListNode *behind = NULL; // 延迟n个才开始遍历的节点.
        ListNode *prevBehind = NULL; 
        while (front != NULL) { 
            front = front->next;
            if (behind) {
                prevBehind = behind;
                behind = behind->next;
            }
            if (!behind && ++i >= n) {
                behind = head;
            }
        }
        if (behind) { // 如果找到第n个节点
            if (behind != head) { // 删除节点
                prevBehind->next = behind->next;
            } else {
                return head->next;
            }
        } 
        return head;
    }
};
