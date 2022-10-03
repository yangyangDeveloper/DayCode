//
//  Solution_452.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

/*
  
  考察点： end升序排列
  1、 end升序排列 找到 当前区间结束最早的 （end最小）
  2、 把所有区间和 x 区间相交的 从 数组中删除
  3、重复1 2   一直到数组为空  之前选出来的 那些 x  就是最大的不相交子集
 
  y
  |   ***
  |    *
  |        ****
  |         *****
  | _______________  x
      #       #        2发射击就可以把所有区间气球打破
 
  细节： 题目要求相交也会引爆 所以相交也算重叠(和435不同)
  所以我们找独立区间 应该是 >
 */

class Solution_452 {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        if points.count == 1 {
            return 1
        }
        // 按照end升序 排列
        let points = points.sorted(by: {$0[1] < $1[1]})
        var end_x = points[0][1]
        var count = 1
        for item in points {
            let start = item[0]
            if start > end_x {
                count += 1
                end_x = item[1]
            }
        }
        // 独立区间 也就是箭
        return count
    }
}
