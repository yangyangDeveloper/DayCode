//
//  Solution_435.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

/*
   考察点：  按照end升序排列
 */

// 435. 无重叠区间
class Solution_435 {
    // 找不相交的区间个数  然后总数-不相交
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let n = intervals.count
        
        // 按照end 升序排列
        var arr = intervals.sorted(by: {$0[1] < $1[1]})
        var count = 1
        
        var x_end = arr[0][1]
        for item in arr {
            // 开始
            var start = item[0]
            // 当前开始大于 之前的结束  更新start_x  count +=1
            if start >= x_end {
                count += 1
                x_end = item[1]
            }
        }
        
        print(count)
        
        return n-count
        
    }
}

