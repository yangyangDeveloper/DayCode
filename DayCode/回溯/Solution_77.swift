//
//  Solution_77.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/13.
//


// 77. 组合
class Solution_77 {
    // 递归回溯  + for循环
    // 递归决定遍历深度
    // for循环决定遍历宽度
    // 加入操作 回溯操作
    var res = [[Int]]()
    var path = [Int]()
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        
        func backtrace(_ startIndex: Int) {
            
            // 终止条件 摘果子
            if path.count == k {
                res.append(path)
                return
            }
            
            // 剪支
            var end = n - (k - path.count) + 1
            // 越界
            guard startIndex <= end  else { return }
            // 题目要求从1开始
            for i in startIndex ... end {
                path.append(i)
                backtrace(i + 1)
                path.removeLast()
            }
        }
        
        backtrace(1)
        return res
    }
}
