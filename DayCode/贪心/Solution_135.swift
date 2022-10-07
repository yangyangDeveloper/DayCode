//
//  Solution_135.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/10/6.
//


/*
  考察点： 贪心 分糖果
  思路：
  1、从前到后  右孩子大于左孩子 candyVec[i] = candyVec[i - 1] + 1
  2、从后往前  左孩子大于右孩子 candyVec[i] = max(candyVec[i], candyVec[i + 1] + 1)
 */

// 135. 分发糖果
class Solution_135 {
    
    func candy(_ ratings: [Int]) -> Int {
        let n = ratings.count
        var res = 0
        var candyVec = [Int](repeating: 1, count: ratings.count)
        
        // 从前到后  右孩子大于左孩子
        for i in 1..<n {
            // 后边的大
            if ratings[i] > ratings[i - 1] {
                candyVec[i] = candyVec[i - 1] + 1
            }
        }
        
        // 从后往前  左孩子大于右孩子
        for i in (0..<n-1).reversed() {
            // 前面的大
            if ratings[i] > ratings[i + 1] {
                candyVec[i] = max(candyVec[i], candyVec[i + 1] + 1)
            }
        }
        
        print(candyVec)
        for item in candyVec {
            res += item
        }
        
        return res
    }
}
