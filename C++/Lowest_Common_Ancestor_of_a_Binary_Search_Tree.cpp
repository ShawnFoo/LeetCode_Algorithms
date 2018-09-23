/**
 235. Lowest Common Ancestor of a Binary Search Tree
 
 Tags: Tree
 
 https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/description/
 */

#include <stdio.h>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

// 思路: BST特点, 左子树上的节点必定比当前节点上的上的小; 右子树, 同理.

/**
 非递归实现, 16ms. 时间复杂度O(logn), 空间复杂度O(1)
 */
class Solution {
public:
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        int minVal = p->val <= q->val ? p->val : q->val;
        int maxVal = p->val <= q->val ? q->val : p->val;
        while (!(root->val >= minVal && root->val <= maxVal)) {
            root = root->val < minVal ? root->right : root->left;
        }
        return root;
    }
};

/**
 递归实现, 16~28ms(先判断root->val > minVal时会短点..测试用例问题)
 */
class SolutionRecursive {
    public:
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        int maxVal = p->val >= q->val ? p->val : q->val;
        int minVal = p->val < q->val ? p->val : q->val;
        if (root->val >= minVal && root->val <= maxVal) {
            return root;
        } else if (root->val > minVal) {
            return lowestCommonAncestor(root->left, p, q);
        } else { // root->val < maxVal
            return lowestCommonAncestor(root->right, p, q);
        }
    }
};
