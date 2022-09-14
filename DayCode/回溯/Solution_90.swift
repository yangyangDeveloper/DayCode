//
//  Solution_90.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/14.
//

import Foundation
// 90. 子集 II
class Solution_90 {
    /*
     
     给你一个整数数组 nums ，其中可能包含重复元素，请你返回该数组所有可能的子集（幂集）。

     解集 不能 包含重复的子集。返回的解集中，子集可以按 任意顺序 排列。
     
     输入：nums = [1,2,2]
     输出：[[],[1],[1,2],[1,2,2],[2],[2,2]]
     
     */
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        var nums = nums.sorted()
        func backtrace(_ startIndex: Int) {
            res.append(path)
            for i in startIndex ..< nums.count {
                if i > startIndex && nums[i - 1] == nums[i] {
                    continue
                }
                path.append(nums[i])
                backtrace(i + 1)
                path.removeLast()
            }
        }
        backtrace(0)
        return res
    }
}
