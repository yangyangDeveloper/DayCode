//
//  Solution_78.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/14.
//

import Foundation
// 78. 子集
class Solution_78 {
    /*
     
     
     给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。

     解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。
     
     输入：nums = [1,2,3]
     输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
     
     */
    
    func subsets(_ nums: [Int]) -> [[Int]] {
            var res = [[Int]]()
            var path = [Int]()
            func backtrack(_ startIndex: Int) {
                res.append(Array(path))

                if startIndex > nums.count {
                    return
                }

                for i in startIndex ..< nums.count {
                    path.append(nums[i])
                    backtrack(i + 1)
                    path.removeLast()
                }
            }

            backtrack(0)
            return res
        }
}
