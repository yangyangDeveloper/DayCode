//
//  Solution_Sort.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/31.
//

import Foundation

class Solution_Sort {
    
    // 冒泡排序
    func sortArray(_ nums: [Int]) -> [Int] {
        var n = nums
        // i 没走一次 就会确定一个队尾的 值
        for i in 0 ..< n.count - 1 {  // 3个 只需要比2次  所以 0<2   0 1 就行了
            // 每走一次 剩下的元素就越来越少
            for j in 0 ..< n.count - 1 - i {
                // 两个两个比较
                if n[j] > n[j+1] {
                    var temp = n[j]
                    n[j] = n[j+1]
                    n[j+1] = temp
                }
            }
        }
        return n
    }
    

    // 选择排序
    func sortArray2(_ nums: [Int]) -> [Int] {
        var list = nums
        for i in 0..<list.count - 1 {
            var minIndex = i
            for j in (i + 1)..<list.count {  // 遍历未排序的元素
                if list[j] <  list[minIndex] {  // 找到本轮目前最小值
                    minIndex = j  //  记录最小下标
                }
            }
            list.swapAt(i, minIndex) // 没论结束 把当论最小值移动到数组前面 
        }
        return list
    }
    
    
    // 插入排序
    func sortArray3(_ nums: [Int]) -> [Int] {
        var arr = nums
        var j = 0
        for i in 0 ..< arr.count {
            j = i - 1
            var temp = arr[i]
            
            // 循环腾出位置
            while j > 0 && arr[j] > temp {
                arr[j + 1] = arr [j]  // arr[j]这张牌比 temp大 那么移动一下
                j -= 1  // 看下张牌  
                // 找到了插入位置的前面
            }
            
            // j+1  就是插入位置
            arr[j + 1] = temp
        }
        return arr
    }
    
    
    
    
    
}
