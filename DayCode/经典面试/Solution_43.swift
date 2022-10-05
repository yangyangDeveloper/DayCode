//
//  Solution_43.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/27.
//

/*
 
  考察点： 双指针
       i
   1 2 3
       j
     4 5
 
   双指针 i j  到序右走
 
   结果存放到res
   num[i]*nums[j]  对应结果存放在 res[i + j]  res[i + j + 1] 的位置
*/

// 43. 字符串相乘
class Solution_43 {
    
    func multiply(_ num1: String, _ num2: String) -> String {
        
        let num1 = num1.map({String($0)})
        let num2 = num2.map({String($0)})
        let m = num1.count
        let n = num2.count
        var arr = [Int](repeating: 0 , count: m + n)
        
        var res = String()
       
        for i in (0..<m).reversed() {
            for j in (0..<n).reversed() {
        
                var mul = Int(num1[i])! * Int(num2[j])!
                
                // 乘积在 res 对应的索引位置
                let p1  = i + j
                let p2  = i + j + 1
                
                // 叠加到 res 上
                let sum = mul + arr[p2]
                arr[p1] += sum / 10
                arr[p2] = sum % 10
            }
        }
        
        // 结果前缀可能存的 0（未使用的位）
        var i = 0
        while i < arr.count && arr[i] == 0 {
            i += 1
            
        }
        // 说明全是0
        if i == arr.count {
            return "0"
        }
        // 有其他数据
        var newarr = Array(arr[i...arr.count-1])
        
        // 拼接字符串
        for i in 0..<newarr.count {
            res += String(newarr[i])
        }
        
        return res
    }
}
