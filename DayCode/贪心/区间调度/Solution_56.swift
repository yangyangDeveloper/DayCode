//
//  Solution_56.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

/*
 
  考察点： 类似数组中 找最大值
  
 case1、 temp合并装入栈
 从栈内取出来  ------
      temp    ---
 
 case2、 2个区间都装入res

 从栈内取出来 -----
 temp             ----
*/


class Solution_56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // 按照start升序排列
        let intervals = intervals.sorted(by: { $0[0] < $1[0]})
        
        var res = [[Int]]()
        res.append(intervals[0])
        
        for i in 1..<intervals.count {
            let temp = intervals[i]
            
            var current = res.removeLast()
            // 允许的线段中断 小于temp的开始 那么吧他们拼接在一起
            if current[1] >= temp[0] {
                current[1] = max(current[1], temp[1])
                res.append(current)
            } else {
                // 否者就是不相交
                res.append(current)
                res.append(temp)
            }
        }
        
        return res
    }
}
