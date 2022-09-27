//
//  Solution_55.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/14.
//

/*
   考察点： 其实就是求最大跳跃距离的
          贪心  全局变量 更新fast
          如果 fast >i  就可以跳  否者就卡住了
*/

// 55. 跳跃游戏
class Solution_55 {
    
    var fast = 0
    func canJump(_ nums: [Int]) -> Bool {
        let n = nums.count
        if n <= 1 {
            return true
        }
        for i in 0..<nums.count - 1 {
            // 每次都是当前位置 + 当前位置的值  就是最大跳远距离
            fast = max(fast, i + nums[i])
            
            // 可能遇到0 卡住了
            if fast <= i {
                return false
            }
        }
        
        return fast >= n - 1
    }
    
    
}
