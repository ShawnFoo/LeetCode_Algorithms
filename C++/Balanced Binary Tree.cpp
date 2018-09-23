/**
 110. Balanced Binary Tree
 
 Tags: Tree、DFS
 
 https://leetcode.com/problems/balanced-binary-tree/
 */

#include <stdio.h>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

/**
 dps实现, 8ms. 时间复杂度O(n), 空间复杂度(n)
 
 思路: 从叶子节点向上到根节点逐个判断左右子树深度差是否大于1
 */
class Solution {
public:
    bool isBalanced(TreeNode* root) {
        if (!root) {
            return true;
        }
        return dsf(root) != -1;
    }
private:
    int dsf(TreeNode* root) {
        if (!root) {
            return 0;
        } else {
            int leftDepth = dsf(root->left);
            if (leftDepth == -1) {
                return -1;
            }
            int rightDepth = dsf(root->right);
            if (rightDepth == -1) {
                return -1;
            }
            int abs = leftDepth - rightDepth;
            if (abs >= -1 && abs <= 1) {
                return (abs >= 0 ? leftDepth : rightDepth) + 1;
            }
            return -1;
        }
    }
};

