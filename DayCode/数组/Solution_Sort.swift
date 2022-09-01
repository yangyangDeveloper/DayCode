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
    
    // 归并排序
    /*
     分治思想
     [8,1,7,4,5,2,3,6]
     */
    func sortArray4(_ nums: [Int]) -> [Int] {
        //var list = nums
        guard nums.count > 1 else { return nums }
        var midindex = nums.count / 2
        let lefta = sortArray4(Array(nums[0..<midindex]))
        print(lefta)
        
        let rightb = sortArray4(Array(nums[midindex..<nums.count]))
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
    
    
    // 快速排序
    func sortArray5(_ nums: [Int]) -> [Int] {
        var a = nums
        return quickSort(&a, 0, nums.count - 1)
    }
    
    /* array：传入参数的数组，注意是传址不是传值
     * p:排序区间起点下标
     * r:排序区间终点点下标
    */
    func quickSort(_ nums: inout [Int], _ l:Int, _ r: Int) -> [Int] {
  
        //  终止条件
        if r <= l {
            return nums
        }
        
        let q = subSort(&nums, l, r)
    
        quickSort(&nums, l, q - 1)
        quickSort(&nums, q + 1, r)
        
        return nums
    }
    
    /*
       * array：传入参数的数组，注意是传址不是传值
       * p:排序区间起点下标
       * r:排序区间终点点下标
       l 到 i 是小于 pivot的    [i i)
       i 到 j 是大于pviot的     [i j]
       j 到 r-1 是 未探索区域    [j ,r-1]
       */
    
    func subSort(_ nums:inout [Int], _ l:Int, _ r: Int) -> Int {
        let pivot = nums[r] // 分界值，一般选数组排序区间末尾元素
        
        var i:Int = l
        
        for j in l...r-1 {
            if nums[j] < pivot {
                nums.swapAt(i, j)
                i += 1 // // 有小于pivot的数字
            }
        }
        
        // 交换 a[i] 与 a[r] 即：将pivot放到相应位置
        nums[r] = nums[i]
        nums[i] = pivot
        
        return i
    }
}
