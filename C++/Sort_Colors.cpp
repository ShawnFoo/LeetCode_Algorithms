/**
 75. Sort Colors
 
 Tags: Array、Two Pointer、Sort
 
 https://leetcode.com/problems/sort-colors/
 */

#include <stdio.h>

class Solution {
public:
    void sortColors(vector<int>& nums) {
        if (nums.size() <= 1) {
            return;
        }
        int head = 0;
        int tail = nums.size() - 1;
        int i = 0;
        while (i <= tail) {
            if (nums[i] == 0) {
                swapTwoElement(nums, i++, head++);
            } else if (nums[i] == 2) {
                swapTwoElement(nums, i, tail--);
            } else {
                i++;
            }
        }
    }
    
    void swapTwoElement(vector<int>& nums, int first, int second) {
        if (first >= 0 && first < nums.size() 
            && second >= 0 && second < nums.size()) {
            int temp = nums[first];
            nums[first] = nums[second];
            nums[second] = temp;
        }
    }
};


