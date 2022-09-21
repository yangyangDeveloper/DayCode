//
//  Solution_48.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/20.
//

/*
    考察点： 就是一个 对角线  + 镜像的 技巧
    顺时90度 就是 对角线1次  镜像1次
    逆时针90度  就是 另外一条对角线1次  镜像1次
*/

import Foundation

// 48. 旋转图像
class Solution_48 {

    // 对角线
    func rotate(_ matrix: inout [[Int]]) {
        var r = matrix.count
        
        // 对角线
        for i in 0..<r {
            for j in i..<r {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
        
        // 返回镜像反转
        for i in 0..<r{
            reverse(&matrix[i])
        }
    }
    
    // 反转每一行里面的元素
    func reverse(_ arr: inout [Int]) {
        var i = 0
        var j = arr.count - 1
        while i < j {
            arr.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
}
