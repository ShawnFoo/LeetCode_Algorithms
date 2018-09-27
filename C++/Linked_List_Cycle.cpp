#include <stdio.h>

/**
 141. Linked List Cycle
 
 Tags: Linked List、Two Pointers
 
 https://leetcode.com/problems/linked-list-cycle/description/
 */

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

/**
 双指针实现, 8ms. 时间复杂度O(n), 空间复杂度O(1)
 
 思路: 使用两个快慢指针同时遍历, 慢指针每次移动1步, 快指针每次移动2步
 
 如果没有环, 那么快指针势必先遍历完; 否则, 随着线性增长关系(速度差为1), 快指针会在某个时间点"撞上"慢指针
 
 当慢指针步入圈内后, 剩余遍历次数 = 快、慢指针步数差 / 速度差
 */
class Solution {
public:
    bool hasCycle(ListNode *head) {
        if (!head || !head->next) {
            return false;
        }
        ListNode *slow = head;
        ListNode *fast = head;
        while (fast->next && fast->next->next) {
            slow = slow->next;
            fast = fast->next->next;
            if (slow == fast) {
                return true;
            }
        }
        return false;
    }
};
