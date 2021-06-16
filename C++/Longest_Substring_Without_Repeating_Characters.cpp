/**
3. Longest Substring Without Repeating Characters

Tags: Hash Table、Two Pointers、String、Sliding Window

https://leetcode.com/problems/longest-substring-without-repeating-characters/
*/

#include <unordered_map>
#include <string>
#include <iostream>
using namespace std;

class Solution {
public:
    int lengthOfLongestSubstring(string s) { 
        if (s.length() <= 1) {
            return s.length();
        }
        int maxLength = 0;
        int head = 0;
        unordered_map<char, int> uMap;
        for (int i = 0; i < s.length(); i++) {
            char ch = s[i];
            if (uMap.find(ch) != uMap.end() && uMap[ch] >= head) { // 保证得是在窗口内的重复字符
                head = uMap[ch] + 1;
            }
            uMap[ch] = i;
            maxLength = max(maxLength, i - head + 1);

        }
        return maxLength;
    }
};