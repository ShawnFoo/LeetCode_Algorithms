import Foundation

/**
 60. Permutation Sequence
 
 Tags: Math、Backtracking
 
 https://leetcode.com/problems/permutation-sequence/description/
 */

/**
 Math实现, 12ms. 时间复杂度O(n), 空间复杂度O(n)
 
 思路: n个数的组合共有n!阶乘次种'排列可能'. 从最高位起, 每个位置依次有n、n-1、n-2、n-i、1种可能
 
 因为组合从小到大升序. 我们可以通过除法操作来计算其每个位置上的数为多少.
 
 比如: 当n=4, k=13时, 当第1个位置确定时, 其排列组合的总数则有(n-1)!阶乘总, 即6种, 因为升序, 我们12/6 = 2, 可排除掉首个位置为1与2开头的共12种可能, 即k=13的数必定在3开头组合里. 同理剩余每个位置都可以基于上一位数已经排除了的个数, 计算下一个位置的数为具体哪个
 
 1 x x x
 // 1 开头的共有 (n-1)!, 即6种
 2 x x x
 // 2开头同样有6种
 3 x x x
 // 同理
 4 x x x
 */
class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var result = ""
        var factorial = 1 // n!
        var seq: [Int] = [] // 尚未排列的数
        for i in 1...n {
            factorial *= i
            seq.append(i)
        }
        var kk = k - 1 // 在(n-i)!种排列组合中, 位于第几个
        for i in 0..<n {
            let count = n - i // 当前位置有几种可能
            factorial /= count // (n-i)! 当前位置确定时, 剩余位置排列组合有几种可能
            let index = kk / factorial // 计算当前位置是哪一个数
            kk = kk % factorial
            result += "\(seq[index])"
            seq.remove(at: index)
        }
        return result
    }
}

/**
 基于Next Permutation暴力实现, 784 ms. 时间复杂度O(n*k), 空间复杂度O(n).
 */
class Solution1 {
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
