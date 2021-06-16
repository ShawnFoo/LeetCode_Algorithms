/**
739. Daily Temperatures

Tags: Stack、Hash Table

https://leetcode.com/problems/daily-temperatures/
*/

#include <vector>
#include <stack>
#include <iostream>
using namespace std;

// stack solution
vector<int> dailyTemperatures(vector<int>& temperatures) {
    if (temperatures.empty()) {
        return vector<int>();
    }
    vector<int> result(temperatures.size(), 0);
    stack<int> iStack;
    for (int i = temperatures.size() - 1; i >= 0; i--) {
        while (!iStack.empty() && temperatures[i] >= temperatures[iStack.top()]) {
            iStack.pop();
        }
        result[i] = iStack.empty() ? 0 : (iStack.top() - i);
        iStack.push(i);
    }
    return result;
}