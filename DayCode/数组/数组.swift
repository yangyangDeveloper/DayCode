//
//  数组.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/19.
//

/*
    双指针 在数组中的玩法 技巧主要分为两大类：
    快慢指针： 原地修改数组   滑动窗口
    左右指针： 二分搜索两端往中间   从中间扩散

 #### 快慢指针
    ## 原地修改数组
    核心细想
    fast探路  如果 fast 和 slow 不一样  那么把slow移动一步 然后把fast对应的值 交给slow
    
    模版一
    [0 slow] 就是我们要的元素
    var slow = 0
    var fast = 0
    while fast < nums.count {
        if nums[fast] != nums[slow] {
            // 注意是 slow + 1 在前  先移动slow指针 在赋值
            slow += 1
            nums[slow] = nums[fast]
        }
        fast += 1
    }
    
    模版二
   [0 slow-1]  不包含值为val的元素
     var slow = 0
     var fast = 0
     while fast < nums.count {
         if nums[fast] != val] {
             // 注意是 slow + 1 在前  先移动slow指针 在赋值
             nums[slow] = nums[fast]
             slow += 1
         }
         fast += 1
     }
 
    26. 删除有序数组中的重复项
    27. 移除元素
    283. 移动零
    83. 删除排序链表中的重复元素
    
 
    ## 滑动窗口
    参考滚动窗口专题
 
 
 #### 左右指针
 
    二分查找
    有序数组 两数之和
    反转数组
    
    回文串判断
    最长回文串
 */
