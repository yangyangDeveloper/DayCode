//
//  Solution_875.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/20.
//

/*
    考察点： 二分查找的模版
    
    取中间数 然后计算出需要的时间 和  h 比较
   1、 给你一个速度 求吃完香蕉需要的时间
   2、 拿时间和 h 对比   如果慢了 就提高速度  如果快了 就降低速度   如果等于 也尝试降低速度 可能还有最优化
    
 */
// 875. 爱吃香蕉的珂珂
class Solution_875 {
    
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var left = 1
        var right = 1
        //  最大速度应该是最大的香蕉堆
        for i in 0..<piles.count {
            right = max(right, piles[i])
        }
        
        while left <= right {
            var mid = left + (right - left) / 2
            let time = sumTime(piles, mid)
            //  速度慢一些  左边界固定  收缩右边界
            if time == h {  // 速度合适 但不一定是最合理的
                right = mid - 1
            } else if time > h {  // 吃的太慢了
                left = mid + 1
            } else if time < h {
                right = mid - 1  // 可能吃的太快了
            }
        }
        return left  // 返回左边界 最小的速度  吃完最多的香蕉
    }
    
    // 假设速度是 x/小时  吃完所有香蕉需要的时间
    func sumTime(_ piles: [Int], _ x: Int) -> Int {
        var times = 0
        for i in 0..<piles.count {
            times = times + (piles[i] / x)
            // 如果小于k根 按照1个小时计算  比如5根速度  这里面有6个香蕉 那么他吃完6个香蕉需要2个小时  而且 不去吃其他香蕉
            if piles[i] % x > 0 {
                times += 1
            }
        }
        return times
    }
    
}
