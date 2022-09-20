//
//  Solution_34.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/20.
//

/*
    考察的是 二分模版 边界模版
    类似题目：
    704. 二分查找
    34. 在排序数组中查找元素的第一个和最后一个位置
    剑指 Offer 53 - I. 在排序数组中查找数字 I
 */
// 34. 在排序数组中查找元素的第一个和最后一个位置
class Solution_34 {
    
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var t1 = findLeft(nums, target)
        var t2 = findRight(nums, target)
        return [t1, t2]
    }
    
    // 寻找左边界
    func findLeft(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            var mid = left + (right - left) / 2
            if nums[mid] == target {
                // 左侧边界锁定，不断的收缩右边
                right = mid - 1
            } else if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }
         }
        
        /*
         while循环结束的时候, left = right + 1
           合理区间
         1 2 2 3
         target = 2  就是合理情况
         target = 8  就是越界情况   left 会有负数情况      left > right  也就是  left = right + 1
         如果使用left判断, target可能是nums[left], 要判断left是否越界
         如果使用right判断, target可能是nums[right+1], 要判断right+1是否越界
         
          right 一直就在3
          若干查找。。。
          left  也来到了3
          继续下去找到3的后面 就不合理了都出界了   因为 left <= right   现在 left 比right大了
         
         */
        // 跳出while的时候 left = right + 1
        if left >= nums.count  || nums[left] != target {
            return -1
        }
        return left
    }
    
    // 寻找右边界
    func findRight(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            var mid = left + (right - left) / 2
            if nums[mid] == target {
                // 右边界是固定的 缩小左边
                left = mid + 1
            } else if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }
        }
        
        /*
           1 2 2 3
         target = 2  就是合理情况
         
         target = 0  就是越界情况   right 会有负数情况   left > right  也就是  left - 1 = right
         边界情况
         left 一直在1
         ....
         right 来到了1
         right下一次来到了 left的左右   打破了边界  left <= right
        */
    
        if right < 0 || nums[right] != target {
            return -1
        }
        return right
    }
    
    
}
