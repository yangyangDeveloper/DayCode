//
//  Solution_969.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/28.
//

/*
   考察点： 递归思想 + 反转
 
      先找到第一个大的饼 放到最下面
      然后在 n-1 中 继续找最大饼
      递归调用
      一直到n = 1  return
       
      当找到一个饼时候怎么反转呢
      1、先找到他的下标 反转到最上面
      2、再从最上面反转到最下面
*/

// 969. 煎饼排序
class Solution_969 {
    
    var res = [Int]()
    func pancakeSort(_ arr: [Int]) -> [Int] {
        var cakes = arr
        sorthelper(&cakes, arr.count)
        return res
    }
    
    // 找到最大值
    func sorthelper(_ cakes: inout [Int], _ n: Int) {
        // base case
        if (n == 1) {
            return
        }
        
        // 寻找最大饼的索引
        var maxcakes = 0
        var maxcakesIndex = 0
        
        for i in 0..<n {
            if cakes[i] > maxcakes {
                maxcakes = cakes[i]
                maxcakesIndex = i
            }
        }
        
        // 第一次反转 讲最大的饼放最上面
        reverse(&cakes, 0, maxcakesIndex)
        res.append(maxcakesIndex + 1)
        
        // 第二次反转 讲最大的饼放最下面
        reverse(&cakes, 0, n - 1)
        res.append(n)
        
        // 递归调用  这时候 下一层cakes接收到的是除去最大的剩下的饼
        sorthelper(&cakes, n - 1)
    }
    
    // 反转 arr的【lef right】区间
    func reverse(_ arr: inout [Int], _ left: Int, _ right: Int) {
        var left = left
        var right = right 
        while left < right {
            let temp = arr[left]
            arr[left] = arr[right]
            arr[right] = temp
            left += 1
            right -= 1
        }
    }
}
