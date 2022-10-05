//
//  So61.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/1.
//

/*
 
 考察点：
 排序
 顺子： 最大值 - 最小值 < 5
 
 0到4封区间
 1、统计大小王数量 jk
 2、相邻两张牌一样 直接 false
 
 最大值 - list[大小王] < 5
 */

// 剑指 Offer 61. 扑克牌中的顺子
class So61 {
    
    func isStraight(_ nums: [Int]) -> Bool {
        let n = nums.count
        let list = nums.sorted()
        var jk = 0
        for i in 0..<4 {
            if list[i] == 0 {
                jk += 1
            }
            else {
                if list[i] == list[i + 1] {
                    return false
                }
            }
        }
        return (nums[n - 1] - nums[jk]) < 5
    }
}
