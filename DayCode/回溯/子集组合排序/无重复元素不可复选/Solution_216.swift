//
//  Solution_216.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/13.
//

/*
   考察点： 组合 无重复元素不可复选的框架  稍微修改一下base case
   思路： for 循环是从 startindex 开始的  每次传递参数 i + 1  就天然去重了
*/

// 216.组合总和III
class Solution_216 {
    
    /*
     
     找出所有相加之和为 n 的 k 个数的组合，且满足下列条件：

     只使用数字1到9
     每个数字 最多使用一次
     返回 所有可能的有效组合的列表 。该列表不能包含相同的组合两次，组合可以以任何顺序返回。
     
     输入: k = 3, n = 7
     输出: [[1,2,4]]
     解释:
     1 + 2 + 4 = 7
     没有其他符合的组合了。
     
     */
    var res = [[Int]]()
    var path = [Int]()

    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        func backtrace(_ sum: Int, _ startIndex: Int) {
            if path.count == k {
                if sum == n {
                    res.append(path)
                     return
                }
            }
            // 优化
            let end = 9 - (k - path.count) + 1
            // 越界
            guard startIndex <= end else { return }

            for i in startIndex ... end {
                let sum = sum + i
                if sum > n {
                    continue
                }
                path.append(i)
                backtrace(sum, i + 1)
                path.removeLast()
            }
        }

        backtrace(0, 1)
        return res
    }
    
    
    
    // 无剪支
    func combinationSum4(_ k: Int, _ n: Int) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        var curSum = 0

        func backtrack(_ startIndex: Int) {
            if path.count == k {
                if curSum == n {
                    res.append(path)
                    return
                }
            }

            if curSum > n {
                return
            }

            if startIndex > n {
                return
            }
            
            // 优化
            let end = 9 - (k - path.count) + 1
            
            for i in startIndex...n {
                curSum += i
                path.append(i)
                backtrack(i + 1)
                path.removeLast()
                curSum -= i
            }
        }

        backtrack(1)
        return res
    }
}
