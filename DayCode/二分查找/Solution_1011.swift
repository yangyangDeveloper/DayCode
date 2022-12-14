//
//  Solution_1011.swift
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
    left：  最小运力是一堆货物里面的最大值   最小值就是每天一条船
    right： 最大运输能力应该是一次性运完     最大值就是超级大船
    mid：   用选的运力 交给一个函数 得到 运完所有货物的时间  supermid  然后和 target对比
    
    supermid > target  运的太慢
    supermid = target  还有没有最优解
    supermid < target  云的太快
 
    类似题目：
    875
    1011
    剑指 Offer II 073. 狒狒吃香蕉
*/

// 1011. 在 D 天内送达包裹的能力
class Solution_1011 {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        // 最大运力保证刚好一次性运完所有包裹   最大值就是超级大船
        // 包裹不能拆开运所以至少保证载重能承载任意一个包裹； 最小值就是每天一条船  
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
     // 等价上面的算法 
//        for i in 0..<weights.count {
//            wight += weights[i]
//            if wight > x {
//                days += 1
//                // 第二天清零了
//                wight = weights[i]
//            }
//        }
        
        return days
    }
}
