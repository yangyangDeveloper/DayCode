//
//  Solution_268.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/28.
//

/*
    考察点：
 
 0 1 2 3
 0 1 3 4
 
 
 0 1 2 3 4
 0 1 0 3 4
 
 2 ^ 0 = 2  利用的是性质  a ^ a = 0  a ^ 0 = a
 
 位运算技巧：
 如果没有缺数字，结果就是0；
 如果缺了一个数字，那么这个数字就消不掉，其它全部消了，所以结果就是这个数字

*/

// 268. 丢失的数字
class Solution_268 {
    
    func missingNumber1(_ nums: [Int]) -> Int {
        let n = nums.count
        var res = 0
        // 先和新补的索引异或一下
        res ^= n
        for i in 0..<n {
            // 和其他的元素、索引做异或
            res ^= i^nums[i]
        }
        return res
    }
    
    func missingNumber2(_ nums: [Int]) -> Int {
        let n = nums.count
        var expect = (0 + n)  * (n + 1) / 2
        var sum = 0
        for n in nums {
            sum += n
        }
        return expect - sum
    }
}
