//
//  Solution_77.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/13.
//


/*
   考察点： 组合 无重复元素不可复选的框架
   思路： for 循环是从 startindex 开始的  每次传递参数 i + 1  就天然去重了
*/

// 77. 组合
class Solution_77 {
    
    // 递归回溯  + for循环
    // 递归决定遍历深度
    // for循环决定遍历宽度
    // 加入操作 回溯操作
    /*
     
     给定两个整数 n 和 k，返回范围 [1, n] 中所有可能的 k 个数的组合。

     你可以按 任何顺序 返回答案。
     输入：n = 4, k = 2
     输出：
     [
       [2,4],
       [3,4],
       [2,3],
       [1,2],
       [1,3],
       [1,4],
     ]
     */
//    var res = [[Int]]()
//    var path = [Int]()
//
//    func combine(_ n: Int, _ k: Int) -> [[Int]] {
//
//
//        func backtrace(_ startIndex: Int) {
//
//            // 终止条件 摘果子
//            if path.count == k {
//                res.append(path)
//                return
//            }
//
//            // 剪支
//            var end = n - (k - path.count) + 1
//            // 越界
//            guard startIndex <= end  else { return }
//            // 题目要求从1开始
//            for i in startIndex ... n {
//                path.append(i)
//                backtrace(i + 1)
//                path.removeLast()
//            }
//        }
//
//        backtrace(1)
//        return res
//    }
    
     // 模版解法
     var res = [[Int]]()
     var path = [Int]()
     func combine(_ n: Int, _ k: Int) -> [[Int]] {

         func backtrace(_ start: Int) {
             
             if path.count == k {
                 res.append(path)
                 return
             }
            
             if start > n {
                 return
             }
             
             for i in start...n {
                 path.append(i)
                 backtrace(i + 1)
                 path.removeLast()
             }
         }

         backtrace(1)
         return res
     }
     
    
}
