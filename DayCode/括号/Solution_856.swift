//
//  Solution_856.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/10/9.
//

import Darwin


// 856. 括号的分数
class Solution_856 {
    // 一次成功出栈 + 1分
    // 左括号入栈  遇到右括号时候 如果栈顶是（ 那么（出栈  指向下一个
    func scoreOfParentheses(_ s: String) -> Int {
        var s = s.map({String($0)})
        var res = 0
        var stack = [String]()
        var flag = true  // 在'(' 后遇到 ')'计算当前括号的深度
        for char in s {
            if char == "(" {
                stack.append(char)
                flag = true
            }else {
                // 上一次是入栈操作
                if flag {  // 则计算当前括号的深度,获取栈的大小
                // 当前深度-1 的平方值
                    var t:Double = Double(stack.count - 1)
                    res += Int(pow(2, t))
                    flag = false
                }
                stack.removeLast()
            }
        }
        return res
    }
}
