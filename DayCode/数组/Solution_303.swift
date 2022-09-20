//
//  Solution_303.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/20.
//

/*
   考察点： 前缀和
   核心思想 用一个presunm数组 之差 求原来数组的子数组的和
   leetcode 
 */

// 303. 区域和检索 - 数组不可变
class Solution_303 {
    
    var preSum:[Int]
    init(_ nums: [Int]) {
        preSum = [Int](repeating: 0, count: nums.count + 1)
    
        for i in 1..<nums.count {
            preSum[i] = preSum[i - 1] + nums[i]
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return preSum[right + 1] - preSum[left]
    }
}
