//
//  Solution_55.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/14.
//

import Foundation
class Solution_55 {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 0 {
            return true
        }
        
        var maxDis = nums[0]
        for i in 1 ..< nums.count - 1 {
            if i <= maxDis {
                maxDis = max(maxDis, nums[i] + i)
            }
        }
        return maxDis >= nums.count - 1
    }
}
