//
//  Solution_Sort.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/31.
//

import Foundation

class Solution_Sort {
    
}


// 冒泡排序
extension Solution_Sort {
    func sortArray(_ nums: [Int]) -> [Int] {
        var n = nums
        // i 没走一次 就会确定一个队尾的 值
        for i in 0 ..< n.count - 1 {  // 3个 只需要比2次  所以 0<2   0 1 就行了
            // 每走一次 剩下的元素就越来越少
            for j in 0 ..< n.count - 1 - i {  // 没走完一次 就会确定一个  第一次进来 i = 0
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
}

// 选择排序
extension Solution_Sort {
   
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
}

// 插入排序
extension Solution_Sort {
    
    // 维护一个有序队列 一般拿第一个元素 当成一个有序队列
    func charusortArray(_ nums: [Int]) -> [Int] {
        var list = nums
        var length = list.count
        var j  = 0
        for i in 0..<length {
            j = i - 1
            var tep = list[i]
            // 移动所有大于tep的牌
            while j >= 0 && list[j] > tep {    //  手里的最大牌 比摸到的大 需要把最大牌移动出去
                list[j+1] = list[j]            // arr[j]这张牌比 temp大 那么移动一下
                j -= 1
            }
            list[j+1] = tep // 插入这张牌
        }
        return list
    }
}

// 快速排序
extension Solution_Sort {
    
    func quicksortArray(_ nums: [Int]) -> [Int] {
        var arr = nums
        return quickSort(&arr, 0, nums.count - 1)
    }
    

    // 拿到新的pivot下标q 继续划分
    // 一直拆分到只有一个元素  一个元素不需要排序
    // 一旦到  a  p  b  时候 其实就结束了

    func quickSort(_ arr: inout [Int], _ le: Int, _ r: Int) -> [Int] {
        if r <= le {
            return arr
        }
        let p = subSort(&arr, le, r)
        quickSort(&arr, le, p - 1)
        quickSort(&arr, p + 1, r)
        return arr
    }
    
    /*
       * array：传入参数的数组，注意是传址不是传值
       * p:排序区间起点下标
       * r:排序区间终点点下标
       l 到 i 是小于 pivot的    [l i)
       i 到 j 是大于pviot的     [i j]
       j 到 r-1 是 未探索区域    [j ,r-1]
    */
    func subSort(_ arr: inout [Int], _ le:Int, _ r: Int) -> Int {
        
        let pivot = arr[r]
        var i: Int = le
        
        // [le, i) < pivot
        // [i, j) > pivot
        // [j, r-1]  未检查区域
        for j in le...r-1 {
            if arr[j] < pivot {
                arr.swapAt(i, j)
                i += 1
            }
        }
        
        arr.swapAt(i, r)
//        arr[r] = arr[i]
//        arr[i] = pivot
        return i
    }
}

// 归并排序
extension Solution_Sort {
    
    /*
     分治思想
     [8,1,7,4,5,2,3,6]
     
     8 1
     7 4
     81 74
     52
     36
     5236
     8174 5236
    
     */
    func guibingsortArray(_ nums: [Int]) -> [Int] {
        //var list = nums
        guard nums.count > 1 else { return nums }
        var midindex = nums.count / 2
        let lefta = guibingsortArray(Array(nums[0..<midindex]))
        print(lefta)
        
        let rightb = guibingsortArray(Array(nums[midindex..<nums.count]))
        print(rightb)
        return merge(lefta, rightb)
    }
    
    // 合并过程
    func merge(_ leftPile: [Int], _ rightPile: [Int]) -> [Int] {
        
        var p = 0
        var q = 0
        var result = [Int]()
               
        while p < leftPile.count && q < rightPile.count {
            
            if leftPile[p] < rightPile[q] {
                result.append(leftPile[p])
                p += 1
            }else if leftPile[p] > rightPile[q] {
                result.append(rightPile[q])
                q += 1
            } else {
                result.append(leftPile[p])
                p += 1
                result.append(rightPile[q])
                q += 1
            }
        }
        
        while p < leftPile.count {
            result.append(leftPile[p])
            p += 1
        }
         
        while q < rightPile.count {
            result.append(rightPile[q])
            q += 1
        }
        print("本轮result=\(result)")
        return result
    }
}
