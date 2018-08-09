import Foundation



/// 暴力递归实现. 超时.
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 {
            return 0
        }
        var sum = 0
        _uniquePaths(&sum, m - 1, n - 1)
        return sum
    }
    
    
    /// 递归计算路线
    ///
    /// - Parameters:
    ///   - sum: 路线总数
    ///   - mSteps: 水平坐标可移动步数
    ///   - nSteps: 垂直坐标可移动步数
    private func _uniquePaths(_ sum: inout Int, _ mSteps: Int, _ nSteps: Int) {
        if mSteps == 0 && nSteps == 0 {
            sum += 1
        } else if mSteps == 0 {
            _uniquePaths(&sum, 0, nSteps - 1)
        } else if nSteps == 0 {
            _uniquePaths(&sum, mSteps - 1, 0)
        } else { // 除非靠边, 否则每个点可以往右移或往下移
            _uniquePaths(&sum, mSteps - 1, nSteps)
            _uniquePaths(&sum, mSteps, nSteps - 1)
        }
    }
}

Solution().uniquePaths(7, 3)
