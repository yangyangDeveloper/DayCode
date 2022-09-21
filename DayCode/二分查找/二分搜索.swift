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
*/


/*
  
    模版：
    1、最基本的二分查找
    2、寻找左侧边界的二分查找
    3、寻找右侧边界的二分查找
  
 一、 最基本的二分查找
  因为我们初始化的时候 right = nums.count - 1
  所以决定了我们的搜索区间是 [left, right]
  所以也决定了 while(left<= right) 要写成<=     因为[2, 2] 还是存在元素的  就是2   所以相等时候不能退出， 只有[3,2] 才能退出
  同时也决定了 left = mid + 1  right = mid - 1
  
  基本模版
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
  
  
  二、寻找左侧边界的二分查找
  我们使用最基本的通用模版
  最后加上补丁
  if left == nums.count || nums[left] != target {
      return -1
  }
  return  left
  
  三、 寻找右侧边界的二分查找
  我们使用最基本的通用模版
  最后加上补丁
  if right < 0 || nums[right] != target {
      return -1
  }
  return right
  
 */




 /*
 具体应用:
 1、吃香蕉
 2、货物运输
 
 注意 left 和 right 的 设定  以及 mid的计算过程
 
 */
