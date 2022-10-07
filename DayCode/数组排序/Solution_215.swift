//
//  Solution_215.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/7/22.
//

/*
   考察点：排序
   快速排序
   时间复杂度是 O(NlogN)，空间复杂度 O(logN) 极端情况下的最坏时间复杂度是 O(N^2)，空间复杂度是 O(N)
   其实就是前序遍历 也可以理解为 构建二叉查找树的过程   最差会退化为构建链表
   需要进行洗牌算法 或者每次挑选p 时候 随机挑选
   
   归并排序 牺牲一定的空间 但是稳定  是后序遍历   保证元素相对位置不变  logn  其实是 分治算法思想
*/

// 215. 数组中的第K个最大元素
class Solution_215 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        if nums.count > 0 && k > 0 {
            var arr = nums.sorted()
            var t = arr.count - k
            return arr[t]
        }
        return 0
    }
}
