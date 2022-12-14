//
//  Solution_34.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/20.
//

/*
    考察的是 二分模版 基本模版 + 打补丁

    最左区间就是
    if left == nums.count || nums[left] != target {
        return -1
    }
    return  left
 
    最右区间就是
    if right < 0 || nums[right] != target {
        return -1
    }
    return right
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
         如果使用left判断, target可能是nums[left], 要判断left是否越界
         如果使用right判断, target可能是nums[right+1], 要判断right+1是否越界
        */
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
                // 右边界锁定 不断的收缩左边
                left = mid + 1
            } else if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }
        }
        
        /*
         while循环结束的时候, left = right + 1 也就是 right = left - 1
         如果使用left判断, target可能是nums[left], 要判断left是否越界
         如果使用right判断, target可能是nums[right+1], 要判断right+1是否越界
        */
        if right < 0 || nums[right] != target {
            return -1
        }
        return right
    }
}
