/**
 160. Intersection of Two Linked Lists
 
 Tags: Linked List
 
 https://leetcode.com/problems/intersection-of-two-linked-lists/description/
 */

#include <stdio.h>
#include <set>

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

/**
 双指针实现, 24ms. 时间复杂度O(m+n), 空间复杂度O(1)
 */
class SolutionTwoPointer {
public:
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        if (!headA || !headB) {
            return NULL;
        }
        int lenA = 0, lenB = 0;
        ListNode *nodeA = endOfList(headA, &lenA);
        ListNode *nodeB = endOfList(headB, &lenB);
        if (nodeA == nodeB) { // 末尾元素相同才肯定相交
            nodeA = headA;
            nodeB = headB;
            while (lenA > lenB) { // A更长的情况
                nodeA = nodeA->next;
                lenA--;
            }
            while (lenA < lenB) { // 或B更长的情况
                nodeB = nodeB->next;
                lenB--;
            }
            while (nodeA != nodeB) {
                nodeA = nodeA->next;
                nodeB = nodeB->next;
            }
            return nodeA;
        }
        return NULL;
    }
private:
    /**
     获取end元素, 以及链表长度
     */
    ListNode* endOfList(ListNode *head, int *length) {
        *length = head ? 1 : 0;
        ListNode *node = head;
        while (node && node->next) {
            node = node->next;
            (*length)++;
        }
        return node;
    }
};

/**
 借助哈希表实现, 60ms. 时间复杂度(max(m, n)), 空间复杂度O(m+n)
 */
class SolutionHashTable {
public:
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        if (!headA || !headB) {
            return NULL;
        }
        set<ListNode *> aSet;
        set<ListNode *> bSet;
        ListNode *aNode = headA;
        ListNode *bNode = headB;
        while (aNode || bNode) {
            if (aNode == bNode && aNode != NULL) {
                return aNode;
            } else {
                if (bNode && aSet.find(bNode) != aSet.end()) {
                    return bNode;
                } else if (aNode && bSet.find(aNode) != bSet.end()) {
                    return aNode;
                }
            }
            if (aNode) {
                aSet.insert(aNode);
                aNode = aNode->next;
            }
            if (bNode) {
                bSet.insert(bNode);
                bNode = bNode->next;
            }
        }
        return NULL;
    }
};

/**
 暴力双循环, 580ms. 时间复杂度O(mn), 空间复杂度O(1)
 */
class SolutionBruteForce {
public:
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        ListNode *aNode = headA;
        ListNode *bNode = NULL;
        while (aNode != NULL) {
            bNode = headB;
            while (bNode != NULL) {
                if (aNode == bNode) {
                    return aNode;
                }
                bNode = bNode->next;
            }
            aNode = aNode->next;
        }
        return NULL;
    }
};
