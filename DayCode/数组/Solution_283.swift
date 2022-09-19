//
//  Solution_283.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/19.
//

import Foundation

/*
 
  考察点：数组中快慢指针的应用 原地修改数组
  属于对 leetcode 27. 移除元素  的衍生题
  套用的是 【0 slow-1】的思想模版   注意先赋值 在++  能却比啊 【0 slow -1】 都不包含val
 
 */

// 283. 移动零
class Solution_283 {
    func moveZeroes(_ nums: inout [Int]) {
        
        // 去除 nums 中的所有 0，返回不含 0 的数组长度
        let p = removeItem(&nums, 0)
        for i in p..<nums.count {
            nums[i] = 0
        }
    }
    
    // 除 nums 中的所有val 返回一个不含val的数组长度
    func removeItem(_ nums: inout [Int], _ val: Int) -> Int {
        var slow = 0
        var fast = 0
        while fast < nums.count {
            if nums[fast] != val {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        return slow
    }
}
