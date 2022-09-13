//
//  Solution_32.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/13.
//

import Foundation
// 39. 组合总和
class Solution_39 {
    var res = [[Int]]()
    var path = [Int]()
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        func backtrace(_ sum: Int, _ startIndex: Int) {
            if sum == target {
                res.append(path)
                return
            }
            
            guard startIndex < candidates.count else { return }
            
            for i in startIndex ..< candidates.count {
                let sum = sum + candidates[i]
                if sum > target {
                    continue
                }
                path.append(candidates[i])
                backtrace(sum, i)
                path.removeLast()
            }
        }
        
        backtrace(0, 0)
        return res
    }
}
