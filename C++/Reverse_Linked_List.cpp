#include <stdio.h>

/**
 206. Reverse Linked List
 
 Tags: Linked List
 
 https://leetcode.com/problems/reverse-linked-list/description/
 */

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

/**
 双指针实现, 4ms. 时间复杂度O(n), 空间复杂度O(1)
 */
class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        ListNode *retHead = head;
        ListNode *cur = head;
        while (cur && cur->next) {
            ListNode *prevHead = retHead;
            ListNode *next = cur->next;
            ListNode *nextNext = next->next;
            
            retHead = next;
            retHead->next = prevHead;
            head->next = nextNext; // 倒序后head就是tail
            cur = head;
        }
        return retHead;
    }
};
