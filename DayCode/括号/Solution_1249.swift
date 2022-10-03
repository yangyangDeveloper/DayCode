//
//  Solution_1249.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/10/3.
//

import Foundation

/*
 考察点： ( 进入 n + 1   ） 进入 n -1
 思路：
 1: 创建一个字符数组charts,创建一个n计数   n为0 就是左右平衡    n>0 就需要移除 (
 2: 遍历字符串，遇到字母，放入数组中
 3: 遇到'(' 放入数组中, n++
 4: 遇到')'，如果n=0，跳过，n>0,放入数组中，n--
 5: 遍历完成后，n>0, 从后往前遍历，删除n个'('


 "))a(b("
 
 "ab"
 
 ["a", "(", "b", "("]
 2
 ["a", "(", "b"]
 ["a", "b"]
*/
class Solution_1249 {
    func minRemoveToMakeValid(_ s: String) -> String {
        var charts:[Character] = []
        var n = 0
        for c in s {
            if c == "(" {
                charts.append(c)
                n += 1
            } else if c == ")" {
                if n > 0 {
                    charts.append(c)
                    n -= 1
                }
            } else {
                charts.append(c)
            }
        }
        print(charts)
        print(n)
        var i = charts.count - 1
        while n > 0 {
            if charts[i] == "(" {
                charts.remove(at: i)
                print(charts)
                n -= 1
            }
            i -= 1
        }
        
        return String(charts)
    }
}
