//
//  Solution_191.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/28.
//

import Foundation

/*
  考察点： 位运算技巧  n & （n - 1） 可以消除二进制中的最后1位1
 
 */
class Solution_191 {
    // 为运算
    func hammingWeight(_ n: Int) -> Int {
        var n = n 
        var res = 0
        while n != 0 {
            n = n & (n - 1)
            res += 1
        }
        return res
    }
}
