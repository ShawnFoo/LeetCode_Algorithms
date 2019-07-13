/**
 * 75. Sort Colors
 * 
 * Tag: Array、Two Pointers、Sort
 * 
 * https://leetcode.com/problems/sort-colors/description/
 */

/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var sortColors = function(nums) {
    if (nums.length > 1) {
        var i = 0; // 当前位置
        var frontIndex = 0; // 前坑位
        var endIndex = nums.length - 1; // 后坑位
        while (i <= endIndex) { // 遍历数组, 把0、2替换到前后坑位上
            if (nums[i] == 0 && i != frontIndex) {
                swapElement(nums, i, frontIndex);
                frontIndex++;
            } else if (nums[i] == 2 && i != endIndex) {
                swapElement(nums, i, endIndex);
                endIndex--;
            } else {
                i++;
            }
        }
    }
    return nums;
};

function swapElement(nums, i, j) {
    nums[i] ^= nums[j];
    nums[j] = nums[i] ^ nums[j];
    nums[i] = nums[i] ^ nums[j];
}

let elems = [2,0,1];
sortColors(elems);
console.log(elems);