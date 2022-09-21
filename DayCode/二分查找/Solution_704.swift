//
//  Solution_704.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/1.
//

/*
    考察点：  二分查找模版的通用写法

    nums = [ 1 2 2 2 5 ]   target 不论是谁
    查找的最终结果 都在 【0，nums.count】 之间

    一、极端情况
    nums = [ 1 2 2 2 5 ] target = 0
    res = 0 代表nums都比target大  有0个元素比 target小

    nums = [ 1 2 2 2 5 ] target = 8
    res = 5  说明nums都比target小 有5个元素比 target大

    二、合理情况
    nums = [ 1 2 2 2 5 ] target = 2  寻找target 在nums中左边界
    res = 1 代表nums中2的最左侧边界是1  也可以理解为nums中有1个数字比2小

    nums = [ 1 2 2 2 5 ] target = 2  寻找target 在nums中右边界
    res = 3 代表nums中2的最右侧边界是3

    类似题目：
    704. 二分查找
    34. 在排序数组中查找元素的第一个和最后一个位置
    剑指 Offer 53 - I. 在排序数组中查找数字 I
*/

class Solution_704 {
    /*
      1、有序
      2、分界 mid = left + (right -left) // 防止溢出
    */
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            var mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            }else if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
}
