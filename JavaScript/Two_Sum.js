/**
 * 1. Two Sum
 * 
 * Tag: Array、Hash Table
 * 
 * https://leetcode.com/problems/two-sum/description/
 */

/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function(nums, target) {
    var dict = {}; // value: index
    for(var i = 0; i < nums.length; i++) {
        if (target - nums[i] in dict) {
            return [dict[target - nums[i]], i];
        } else {
            dict[nums[i]] = i;
        }
    }
    return [];
};

console.log(twoSum([1, 2, 3, 4, 9], 7))