//
//  Solution_491.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/14.
//

import Foundation
// 491. 递增子序列
class Solution_491 {
    /*
     
     给你一个整数数组 nums ，找出并返回所有该数组中不同的递增子序列，递增子序列中 至少有两个元素 。你可以按 任意顺序 返回答案。

     数组中可能含有重复元素，如出现两个整数相等，也可以视作递增序列的一种特殊情况。
     
     输入：nums = [4,6,7,7]
     输出：[[4,6],[4,6,7],[4,6,7,7],[4,7],[4,7,7],[6,7],[6,7,7],[7,7]]

     输入：nums = [4,4,3,2,1]
     输出：[[4,4]]
     
     */
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var path = [Int]()
        func backtracking(startIndex: Int) {
            // 收集结果，但不返回，因为后续还要以此基础拼接
            if path.count > 1 {
                result.append(path)
            }
            
            var uset = Set<Int>()
            let end = nums.count
            guard startIndex < end else { return } // 终止条件
            for i in startIndex ..< end {
                let num = nums[i]
                if uset.contains(num) { continue } // 跳过重复元素
                if !path.isEmpty, num < path.last! { continue } // 确保递增
                uset.insert(num) // 通过set记录
                path.append(num) // 处理：收集元素
                backtracking(startIndex: i + 1) // 元素不重复访问
                path.removeLast() // 回溯
            }
        }
        backtracking(startIndex: 0)
        return result
    }
}
