//
//  Solution_216.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/13.
//

// 216.组合总和III
class Solution_216 {
    
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
}
