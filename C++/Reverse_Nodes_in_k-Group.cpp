/**
25. Reverse Nodes in k-Group

Tags: Linked List

https://leetcode.com/problems/reverse-nodes-in-k-group/description/
*/

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

/**
 递归实现, 12ms. 时间复杂度O(n), 空间复杂度O(1)

 思路: 每隔k个则对这一小段范围的节点进行reverse. 每次操作都是一样的, 可递归复用
 */
class Solution {
    public:
    ListNode* reverseKGroup(ListNode* head, int k) {
        if (k == 1) {
            return head;
        }
        ListNode *curNode = head;
        int i = 0;
        while (i < k && curNode) {
            curNode = curNode->next;
            i++;
        }
        if (i < k) { // 小于k保持原样
            return head;
        } else { // 剩余节点数>=k
            ListNode *retHead = head;
            curNode = head;
            i = 1;
            while (i < k && curNode) {
                ListNode *prevNode = retHead;
                ListNode *nextNode = curNode->next;
                ListNode *nextNextNode = nextNode ? nextNode->next : NULL;
                
                retHead = nextNode;
                retHead->next = prevNode;
                head->next = nextNextNode; // head翻转后即为tail节点
                i++;
            }
            head->next = reverseKGroup(head->next, k);
            return retHead;
        }
    }
};
