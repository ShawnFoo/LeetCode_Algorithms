import Foundation

/**
 60. Permutation Sequence
 
 Tags: Math、Backtracking
 
 https://leetcode.com/problems/permutation-sequence/description/
 */

/**
 基于Next Permutation暴力实现. 784 ms
 */
class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        if n < 1 || n > 9 {
            return ""
        }
        var seq: [Int] = []
        for i in 1...n {
            seq.append(i)
        }
        var index = 1
        while index < k {
            nextPermutation(&seq)
            index += 1
        }
        return stringOf(seq)
    }
    
    private func nextPermutation(_ seq: inout [Int]) {
        var i = seq.count - 1
        var repLoc = i
        var minLoc = i
        while i > 0 { // 倒序遍历
            if seq[i] > seq[i - 1] { // 找到某个位置, 其后的数都为降序
                repLoc = i - 1
                // 再其后找一个最小且刚好大过该位置的数, 进行交换
                for j in repLoc+1..<seq.count {
                    if seq[j] > seq[repLoc] {
                        minLoc = j
                    } else {
                        break
                    }
                }
                seq.swapAt(repLoc, minLoc)
                // 因为repLoc后的数为降序, 需倒序一次求得最小, 则为下一个刚好大于当前组合的排列数
                reverseArea(repLoc + 1, seq.count - 1, &seq)
                break
            }
            i -= 1
        }
    }
    
    private func reverseArea(_ start: Int, _ end: Int, _ seq: inout [Int]) {
        if start >= end {
            return
        }
        var index = 0
        let count = end - start + 1
        let halfCount = count / 2
        while index < halfCount {
            let front = start + index
            let end = count - index - 1 + start
            seq.swapAt(front, end)
            index += 1
        }
    }
    
    private func stringOf(_ num: [Int]) -> String {
        var result = ""
        for i in 0..<num.count {
            result += "\(num[i])"
        }
        return result
    }
}

Solution().getPermutation(3, 3)
Solution().getPermutation(4, 7)
