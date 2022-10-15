//
//  Solution_1441.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/10/15.
//

import Foundation
// 1441. 用栈操作构建数组
class Solution_1441 {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var res = [String]()

        var index = 0
        for i in 1...n {
            // 发现完成提前结束
            if index == target.count {
                break
            }

            if i == target[index] {
                res.append("Push")
                index += 1
            }else {
                res.append("Push")
                res.append("Pop")
            }
        }

        return res
    }
}
