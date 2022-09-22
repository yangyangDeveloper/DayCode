//
//  Solution_912.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/22.
//

import Foundation

class Solution_912 {

    var temp = [Int]()
    func sortArray(_ nums: [Int]) -> [Int] {
        
        if nums.count == 0 {
            return []
        }
        if nums.count == 1 {
            return nums
        }
        
        var nums = nums
        temp = [Int](repeating:0, count: nums.count)
        helper(&nums, 0, nums.count - 1)
        return nums
    }
    
    // 定义：将子数组 nums[lo..hi] 进行排序
    func helper(_ nums: inout [Int], _ left: Int, _ right: Int) {
        if left == right {
            // 单个元素不用排序
            return
        }

        let mid =  left + (right - left ) / 2
        helper(&nums, left, mid)
        
        // 再对右半部分数组 nums[mid+1..hi] 排序
        helper(&nums, mid + 1, right)
        
        merge(&nums, left, mid, right)
    }
       
    // 将 nums[lo..mid] 和 nums[mid+1..hi] 这两个有序数组合并成一个有序数组
    func merge(_ nums: inout [Int], _ left: Int, _ mid: Int, _ right: Int) {
         
         for i in left...right {
             temp[i] = nums[i]
         }
        
         var i = left
         var j = mid + 1
         
         for p in left...right {
             
             // 左半数组是否全部合并
             if i == mid + 1 {
                 nums[p] = temp[j]
                 j += 1
             // 右半数组是否全部合并
             } else if j == right + 1 {
                 nums[p] = temp[i]
                 i += 1
             
             } else if temp[i] > temp[j] {
                 nums[p] = temp[j]
                 j += 1
             } else {
                 nums[p] = temp[i]
                i += 1
             }
         }
    }
}
