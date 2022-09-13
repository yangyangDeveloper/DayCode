//
//  Solution_46.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/13.
//

import Foundation
class Solution_46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        func backtrace() {
            if path.count == nums.count {
                res.append(Array(path))
            }
            
            for i in 0 ..< nums.count {
                if path.contains(nums[i]) {
                    continue
                }
                path.append(nums[i])
                backtrace()
                path.removeLast()
            }
        }
        backtrace()
        return res
    }
}
