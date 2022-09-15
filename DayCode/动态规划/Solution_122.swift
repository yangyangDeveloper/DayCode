//
//  Solution_122.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/15.
//

import Foundation
class Solution_122 {
    
    // 贪心算法
    // 只要今天比昨天大，就卖出
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 1 {
            return 0
        }
        var res = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i - 1] {
                res += prices[i] - prices[i - 1]
            }
        }
        return res
    }
}
