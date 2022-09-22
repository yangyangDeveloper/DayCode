//
//  Solution_40.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/13.
//


/*
   考察点： 组合 无重复元素不可复选的框架  稍微修改一下base case 
   思路： for 循环是从 startindex 开始的  每次传递参数 i + 1  就天然去重了
   
*/

// 40. 组合总和 II
import Foundation
class Solution_40 {
    /*
     
     给定一个候选人编号的集合 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
     
     candidates 中的每个数字在每个组合中只能使用 一次 。
     
     输入: candidates = [10,1,2,7,6,1,5], target = 8,
     输出:
     [
     [1,1,6],
     [1,2,5],
     [1,7],
     [2,6]
     ]
     */
    
//    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
//
//        // 为了方便去重复，先对集合排序
//        var candidates = candidates
//        var arr = candidates.sorted()
//        var res  = [[Int]]()
//        var path = [Int]()
//        var used = [Bool](repeating: false, count: candidates.count)
//        func backtrace(_ s: Int, _ startIndex: Int, _ used: inout [Bool]) {
//
//            if s == target {
//                res.append(path)
//                return
//            }
//
//            guard startIndex < arr.count else { return }
//
//            for i in startIndex ..< arr.count {
//                // 去重操作
//                // 要对同一树层使用过的元素进行跳过
//                // 第一个能用 其他同层的就不能用了
//                // used[i - 1] == true，说明同一树枝candidates[i - 1]使用过
//                // used[i - 1] == false，说明同一树层candidates[i - 1]使用过
//                // 要对同一树层使用过的元素进行跳过
//                if i > 0, arr[i] == arr[i - 1], used[i - 1] == false {
//                    continue
//                }
//                //  使用局部变量隐藏回溯
//                let sum = s + arr[i]
//                if sum > target { // 剪枝
//                    continue
//                }
//                path.append(arr[i])
//                used[i] = true
//                backtrace(sum, i + 1, &used)
//                used[i] = false
//                path.removeLast()
//
//            }
//        }
//        backtrace(0, 0, &used)
//        return res
//    }
//
    
    // 模版解法
    // 重复元素 不可复选的 组合
     var res = [[Int]]()
     var path = [Int]()
     var curSum = 0
     func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
         var candidates = candidates
         // 记得先排序
         candidates = candidates.sorted()
         backtrace(candidates, target, 0)
         return res
     }
     // 回溯函数
     func backtrace(_ candidates: [Int], _ target: Int, _ start: Int) {

         if curSum == target {
             res.append(path)
         }

         if curSum > target {
             return
         }

         for i in start..<candidates.count {

             if i > start && candidates[i] == candidates[i - 1] {
                 continue
             }

             curSum += candidates[i]
             path.append(candidates[i])
             backtrace(candidates, target, i + 1)
             path.removeLast()
             curSum -= candidates[i]
         }
     }
    
}
