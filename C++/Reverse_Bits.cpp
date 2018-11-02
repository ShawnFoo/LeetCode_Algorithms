/**
190. Reverse Bits

Tags: Bit Manipulation

https://leetcode.com/problems/reverse-bits/description/
*/

/**
 逐位反转实现. 4ms
 */
class Solution {
public:
    uint32_t reverseBits(uint32_t n) {
        uint32_t result = 0;
        for(int i = 31; i >= 0; i--) {
            result += ((n >> i) & 1) << (31 - i); // 取最低位对应左移
        }
        return result;
    }
};
