//
//  Solution_875.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/20.
//

/*
    考察点： 二分查找模版的 生活应用
 
    二分查找基础模版 + 打补丁 + （left right supermid）
 
    生活例子中这几个值需要我们自己确定值
    left
    right
    mid
 
    这列题目 通常 target 是别人给的 限制时间
    然后 left  rihgt 需要我么结合场景去寻找 最小值 和 最大值
    mid 是我们使用 left + (right - left) / 2   在传递给一个函数 计算出来一个 supermid
    supermid 和 target 进行对比
    
    本题：
    left：  最慢速度 1次1根
    right： 最大速度 最大的香蕉堆
    mid：   用选的速度 交给一个函数 得到 吃完所有香蕉需要的时间  supermid  然后和 target对比
    
    supermid > target  吃的太慢
    supermid = target  还有没有最优解
    supermid < target  吃的太快
  
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
