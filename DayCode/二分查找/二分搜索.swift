//
//  二分搜索.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/21.
//

import Foundation

/*
   思想： 折半搜索  longn
 
   变种：
   下表 0 1 2 3 4 5 6
   元素 1 2 4 4 4 5 6
   1、搜索1个      1 2 4 4 4 5 6   target  4   返回找到的一个4的 下标为 3
   2、搜索左边界    1 2 4 4 4 5 6   target  4   返回所有4的最左侧 下表为 2
   3、搜索右边界    1 2 4 4 4 5 6   target  4   返回所有4的最右侧 下表为 4
 
   模版：
   
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
 

 注意边界情况  模版后面打下  打下补丁
 
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
 
 
 
 ##########################
 
 具体应用:
 1、吃香蕉
 2、货物运输
 
 注意 left 和 right 的 设定  以及 mid的计算过程
 
 */
