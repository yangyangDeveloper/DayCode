//
//  Solution_231.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/28.
//

/*
 
 考察点：
 一个数如果是 2 的指数，那么它的二进制表示一定只含有一个 1：
 
 2^0 = 1 = 0001
 2^1 = 2 = 0010
 2^2 = 4 = 0100
 
*/

// 判断一个数是不是 2 的指数
class Solution_231 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        return n & (n - 1)  == 0
    }
}
