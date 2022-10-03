//
//  Solution_921.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/27.
//

/*
    考察点：  通过一个 need 变量记录对右括号的需求数，根据 need 的变化来判断是否需要插入   插入可以是( 也开始是 ）
    need是右括号 需要的个数
    res 是需要的插入次数
    记住边界情况
    ） -1   需要 插入一次(  同时讲 need设置为0
*/

// 921. 使括号有效的最少添加
class Solution_921 {
    func minAddToMakeValid(_ s: String) -> Int {
        let s = Array(s)
        var res = 0
        var need = 0
        for char in s {
            
            if char == "(" {
                need += 1
            }
            if char == ")" {
                need -= 1
                
                if need == -1 {
                    need = 0
                    // 需要插入一次  插入的是 （
                    res += 1
                }
            }
        }
        return res + need
    }
}
