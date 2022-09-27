//
//  Solution_986.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

import Foundation
class Solution_986 {
    
    /*
       不相交的情况
       b2 < a1  || a2 < b1
       case1
       a1 ----- a2
                    b1----b2
     
       case 2
       b1 ------ b2
                    a1 ----a2
     
       相交存在交集4种情况
       b2 >= a1 && a2 >= b1
     
       case 1
       a1------a2
          b1------b2
            ---
     
       case2
       b1 ----- b2
          a1 ---- b2
             ---
      
       case3
       a1 ------- a2
          b1---b2
            ---
     
       case4
       b1 ------- b2
          a1---a2
            ---
     
       交集 [max(a1, b1), min(a2, b2)]
       
      
       i  j 分别对应 a b 的移动
       
       如果 a2比较大  那么 移动j 取找交集 反之 移动 i
       移动j
       i
       a1 ------------ a2
       
       j            j
       b1 --- b2   b1 --- b2
       
     
       移动i
       i           i
       a1 --- a2  a1 -- a2
      
       j
       b1 --------------b2
    
    */
    
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var i = 0
        var j = 0
        var res = [[Int]]()
        let m = firstList.count
        let n = secondList.count
        
        while i < m && j < n {
            let a1 = firstList[i][0]
            let a2 = firstList[i][1]
            let b1 = secondList[j][0]
            let b2 = secondList[j][1]
            
            // 两个区间存在交集
            if b2 >= a1 && a2 >= b1 {
                res.append([max(a1, b1), min(a2, b2)])
            }
            
            if b2 < a2 {
                j += 1
            }else {
                
                i += 1
            }
        }
        return res
    }
}
