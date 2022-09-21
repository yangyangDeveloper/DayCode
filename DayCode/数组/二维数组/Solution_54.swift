//
//  Solution_54.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/20.
//

class Solution_54 {
    /* 设置4个边界
     upbound      rightbound
     
     leftbound    downbound
     */
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var upbound = 0
        var leftbound = 0
        var r = matrix.count
        var c = matrix[0].count
        var ret: [Int] = [Int]()
        
        var rightbound = matrix[0].count - 1
        var downbound = matrix.count - 1
        
        while ret.count < r * c {
            
            // 在顶部从左向右遍历
            for j in leftbound...rightbound{
                ret.append(matrix[upbound][j])
            }
            upbound += 1
            if upbound > downbound {
                break
            }
            
            // 在右侧从上向下遍历
            for i in upbound...downbound {
                ret.append(matrix[i][rightbound])
            }
            rightbound -= 1
            if leftbound > rightbound {
                break
            }
            
            // 在底部从右向左遍历
            for j in (leftbound...rightbound).reversed() {
                ret.append(matrix[downbound][j])
            }
            // 下边界上移
            downbound -= 1
            if upbound > downbound {
                break
            }
            
            // 在左侧从下向上遍历
            for i in (upbound...downbound).reversed() {
                ret.append(matrix[i][leftbound])
            }
            
            // 左边界右移
            leftbound += 1
            if leftbound > rightbound {
                break
            }
        }
        
        return ret
    }
}
