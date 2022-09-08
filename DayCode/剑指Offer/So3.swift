//
//  So3.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/7.
//

// 剑指 Offer 03. 数组中重复的数字
class So3 {
    
    // 时间O(nlogn)了，空间O(n)
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var arr = nums.sorted()
        for i in 0..<arr.count - 1 {
            if arr[i] == arr[i+1] {
                return arr[i]
            }
        }
        return 0
    }
    
    //  时间o(n) 空间o(n)
    func findRepeatNumber2(_ nums: [Int]) -> Int {
        var dic = [Int:Int]()
        for num in nums {
            if dic.keys.contains(num) {
                return num
            } else {
                dic[num] = 1
            }
        }
        return 0
    }
}
