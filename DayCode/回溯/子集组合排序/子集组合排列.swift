//
//  子集组合排列.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/22.
//

import Foundation

/*
  
  1、 子集
  2、 组合
  3、 排列
  
  无重复元素不可复选
  子集/数组  使用 starindex 去除复选  backtrace(i + 1)
  排列  因为是从0开始  所以不能用starindex  他使用 userd数组   （注意使用 contains判断也可以 只不过消耗性能）
 
 
  无重复元素可复选
  子集/数组 直接 backtrace(i)
  排列  什么剪支逻辑都不用用
 
 
  无重复元素可以复选
  子集/数组
   i > starindex && nums[i] == nums[i - 1] {
    continue
   }
 
  
  排列 剪支逻辑
 
  if used[i] {
    continue
  }
 
  if i > 0 && nums[i] == nums[i - 1] && !used[i - 1] {
    continue
  }
  
 */

/*
 
回溯 模版
 
func backtrace(_ nums:[Int]) {
    if 满足条件 {
        收集选择形成的路径path
        return
    }
    
    for 所有可以选择的路径 {
        
        // 剪支逻辑

        // 收集操作
        backtrace()
        // 回溯操作
    }
}

*/


