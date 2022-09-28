//
//  Solution_131.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/28.
//

/*
  考察点： 位运算技巧  ^ 异或操作
  一个数和它本身做异或运算结果为 0，即 a ^ a = 0
  一个数和 0 做异或运算的结果为它本身，即 a ^ 0 = a
 
 */
// 136. 只出现一次的数字
class Solution_136 {
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for n in nums {
            res ^= n
        }
        return res
    }
}
