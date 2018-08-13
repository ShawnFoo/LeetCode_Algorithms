import Foundation

/**
 56. Merge Intervals

 Tags: Array、Sort
 
 https://leetcode.com/problems/merge-intervals/description/
 */

class Solution {
    func merge(_ intervals: [Interval]) -> [Interval] {
        let sortedIntervals = intervals.sorted(by: { $0.end <= $1.start || $0.start <= $1.start })
        var results: [Interval] = []
        for interval in sortedIntervals {
            if results.isEmpty {
                results.append(interval)
            } else {
                let lastOne = results.last!
                if lastOne.end < interval.start { // 无交集
                    results.append(interval)
                } else { // 有交集
                    lastOne.end = max(lastOne.end, interval.end)
                }
            }
        }
        return results
    }
}

Solution().merge([Interval(1, 3),Interval(2, 6),Interval(8,10),Interval(15, 18)])
Solution().merge([Interval(1, 9),Interval(2, 5),Interval(19,20),Interval(10, 11),Interval(12, 20),Interval(0, 3),Interval(0, 1),Interval(0, 2)])


