//
//  Solution_1288.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

import Foundation
/*
    
    考察点：  找到覆盖的区间个数  然后总区间数-覆盖区间数
    
   case1 完全覆盖   count + 1
    ----
     --
   
   case2 相交 我们合并  更新right
    ----
       ---
    
   case3 不相交    更新left right
    ----
           ----
    
    循环一遍找到 完全覆盖的个数
    然后把总的个数 - 覆盖的个数
 
    排序 ： 按照起点升序  起点相等时候 按照终点降序 保证长线段在前面
    排序之后 相邻的线段关系有3种
    1、 覆盖
    2、 相交
    3、 没有任何关系
*/

class Solution_1288 {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        var intervals = intervals
        
//        let arr = intervals.sorted { (arr1, arr2) -> Bool in
//               return arr1[0] < arr2[0]
//        }


        
        intervals.sort { (value1: [Int], value2: [Int]) -> Bool in
            if(value1.first  == value2.first) {
                // 起点相同按照终点将序
                return (value1.last ?? 0 > value2.last ?? 0)
            }
            // 起点升序
            return (value1.first ?? 0 < value2.first ?? 0)
        }
        
        let n = intervals.count
        if n == 1 {
            return 1
        }
    
        // 左边右边
        var left = intervals[0][0]
        var right = intervals[0][1]
        var count = 0
        for i in 1..<n {
            var item = intervals[i]
            // 情况一，找到覆盖区间
            if item[0] >= left && item[1] <= right {
                count += 1
            }
            
            // 情况二，找到相交区间，合并
            if item[0] >= left && item[1] >= right {
                right = item[1]
            }
            
            // 情况三，完全不相交，更新起点和终点
            if item[0] > right {
                left = item[0]
                right = item[1]
            }
        }
        
        // count 就是覆盖的区间
        
      return n - count
    }
}
