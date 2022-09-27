//
//  Solution_20.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/27.
//

/*
   括号问题：
   多种括号用栈
   一种括号用need变量
 
 
   利用栈结果
   1、遇到{ [ ( 入栈
   2、遇到右括号 就用c } ] )  去查找对应的 { ] (   然后和栈顶元素对比  如果匹配上就 出栈   后栈为空就是合法
   
 */

// 20. 有效的括号
class Solution_20 {
    func isValid(_ s: String) -> Bool {
        let str = Array(s)
        var stack = [Character]()
        for char in str {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            }else { // 遇到的是右括号
                if stack.count > 0 &&  leftof(char) == stack.last! {
                    stack.removeLast()
                }else {
                    // 和最近的左括号不匹配
                    return false
                }
            }
        }
        return stack.isEmpty
    }
    
    // 配对
    func leftof(_ s: Character) -> Character {
        if s == ")" {
            return "("
        }
        if s == "]" {
            return "["
        }
        return "{"
    }
}
