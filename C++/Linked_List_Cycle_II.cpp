#include <stdio.h>

/**
 142. Linked List Cycle II
 
 Tags: Linked List、Two Pointers
 
 https://leetcode.com/problems/linked-list-cycle-ii/description/
 */

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

/**
 双指针实现, 4ms
 */
class Solution {
public:
    ListNode *detectCycle(ListNode *head) {
        if (head) {
            ListNode *slow = head;
            ListNode *fast = head;
            while (fast && fast->next) {
                slow = slow->next;
                fast = fast->next->next;
                if (slow == fast) {
                    slow = head;
                    while (slow != fast) {
                        slow = slow->next;
                        fast = fast->next;
                    }
                    return slow;
                }
            }
        }
        return NULL;
    }
};
