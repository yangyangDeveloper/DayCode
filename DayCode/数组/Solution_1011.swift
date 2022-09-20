//
//  Solution_1011.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/20.
//

/*
 
   考察点 二分查找模版 里面的找最左侧边界
   只不过 mid 不是数字了 需要我们自己通过一个函数 计算出来
   left 和 right 也需要我们计算出来 不如以前的 [1 2 3 4 5] 让你找3了
   mid 需要我们通过一个函数计算出来   而target 是人家的限制条件
   通过吃香蕉 或者 船运力 来计算出来mid  进行对比
   
   类似题目：
   875
   1011
   剑指 Offer II 073. 狒狒吃香蕉
 
 */

// 1011. 在 D 天内送达包裹的能力
class Solution_1011 {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        
        var leftvalue = 0
        var maxvalue = 0
        for i in 0..<weights.count {
            // 最大运输能力应该是一次性运完    最大值就是超级大船
            maxvalue += weights[i]
            // 最小运力是一堆货物里面的最大值   最小值就是每天一条船
            leftvalue = max(leftvalue, weights[i])
        }
        
        // 每天的最小运力是 货物里面的最大值
        var left = leftvalue
        // 每天的最大运力是 一次把所有货物拉走完 超级大船
        var right = maxvalue
        
        while left <= right {
            var mid = left + (right - left) / 2
            var useday = usedays(weights, mid)
            if useday == days {
                right = mid - 1
            }else if useday > days {
                left = mid + 1
            }else if useday < days {
                right = mid - 1
            }
        }
        
        return left
    }
    
    // /x为装载量,f(x)为装载量为x时运完所有货物所需要的天数
    func usedays(_ weights: [Int], _ x: Int) -> Int {
        var weight = 0
        var days = 1
        for i in 0..<weights.count {
            if weight + weights[i] <= x {
                // 也就是weights[i]装的下
                weight += weights[i]
            } else {
                // 当前货物今天的航班已经装不下了,那只能至少至少再装一天
                // 并且第二天再去装,sum已经置空了
                weight = weights[i]
                days += 1
            }
        }
        return days
    }
}
