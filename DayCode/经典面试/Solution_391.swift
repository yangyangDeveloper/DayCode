//
//  Solution_391.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/28.
//

/*
    考察点： 面积必须相等 + 顶点必须是4个 而且是大巨型的
    顶点：偶数次移除  奇数次添加
*/
class Solution_391 {
    
    // 转化为面积  假设是一个完美巨型 计算面积   然后和叠加的小巨星对比 计算面积
    // 第一关： 面积不同 一定不完美
    // 第二关： 面积相同 也不一定完美  还需要借助顶点来辅助
    
    var set = Set<Int>()
    func isRectangleCover(_ rectangles: [[Int]]) -> Bool {
        // 大巨型的左下角和右上角
        var X1 = Int.max
        var Y1 = Int.max
        var X2 = Int.min
        var Y2 = Int.min
        
        var ac_area = 0
        var ex_area = 0
        
        for res in rectangles {
            var x1 = res[0]
            var y1 = res[1]
            var x2 = res[2]
            var y2 = res[3]
            
            X1 = min(X1, x1)
            Y1 = min(Y1, y1)
            
            X2 = max(X2, x2)
            Y2 = max(Y2, y2)
            // 计算叠加的面积
            ac_area += (x2 - x1) * (y2 - y1)
            
            // 记录每个顶点出现的次数
           record(x1, y1)
           record(x1, y2)
           record(x2, y1)
           record(x2, y2)
        }
        
        //完美平铺的面积
        ex_area = (X2 - X1) * (Y2 - Y1)
        
        // 判断面积
        if ac_area != ex_area {
            return false
        }
        
        //  辅助顶点
        if set.count != 4 {
            return false
        }
        
        if !set.contains(key(X1, Y1)) {
            return false
        }
        if !set.contains(key(X1, Y2)) {
            return false
        }
        
        if !set.contains(key(X2, Y1)) {
            return false
        }
        if !set.contains(key(X2, Y2)) {
            return false
        }
        
        return true
    }
    
    // // 二维坐标转一维，方便比较
    func key(_ x: Int, _ y: Int) -> Int {
        // 10000007 是随便取的一个大质数
        return x * 100000007 + y
    }
    
    // 记录顶点出现的次数，如果一个顶点出现偶数次，则移除
    func record(_ x: Int, _ y: Int) {
        let key = key(x, y)
        if set.contains(key) {
            set.remove(key)
        } else {
            set.insert(key)
        }
    }
}
