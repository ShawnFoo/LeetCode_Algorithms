/*
Two Sum

Tag: Array、 Hash Table

https://leetcode.com/problems/two-sum/description/
*/

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
	var numIndexDic: [Int: Int] = [:]
	for i in 0..<nums.count {
		let diff = target - nums[i]
		if numIndexDic.keys.contains(diff) {
			return [numIndexDic[diff]!, i]
		}
		numIndexDic[nums[i]] = i
	}
	return []
}
