import Foundation

/**
 Implement strStr()
 
 Tags: Two Pointers
 
 https://leetcode.com/problems/implement-strstr/description/
 */


/// 暴力法. 时间复杂度O(n * m)
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hCount = haystack.count
        let nCount = needle.count
        if nCount == 0 {
            return 0
        } else if (hCount >= nCount) {
            var i = 0
            let hChars = Array(haystack)
            let nChars = Array(needle)
            while i + nCount <= hCount {
                var hPointer = i
                var nPointer = 0
                while nPointer < nCount && hChars[hPointer] == nChars[nPointer] {
                    hPointer += 1
                    nPointer += 1
                }
                if nPointer == nCount {
                    return i
                }
                i += 1
            }
        }
        return -1
    }
}

Solution().strStr("hello", "ll")
