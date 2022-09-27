//
//  Solution_1541.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/27.
//


/*
   思考点： 和 921 思路一样  一个左括号对应2个右括号 才算合理
 
          用一个need变量记录对右括号的需求  根据need的变化来思考是否需要插入
          唯一不同的点是需要考虑  need为奇数情况
记住两种case
    1、（)(
    2、 )
 
 比如 ()(  需要3个） 匹配
 这个时候需要 先插入一个 ）  然后need - 1
 ()) (
 最后在补上右括号 ））
 
 
 )  这个时候need = -1   -1需要进行插入操作  插入的是 （   然后 need 的需要变成 1
 */

// 1541. 平衡括号字符串的最少插入次数
class Solution_1541 {
    func minInsertions(_ s: String) -> Int {
        var res = 0
        // need 是需要的右括号数量
        var need = 0
        var s = Array(s)
        for char in s {
            // 一个左括号对应2个右括号
            if char == "(" {
                need += 2
                if need % 2 == 1 {
                    res += 1  // 需要插入操作
                    need -= 1
                }
            }
             
            if char == ")" {
                need -= 1
                // 右括号太多
                if need == -1 {
                    res += 1
                    need = 1
                }
            }
        }
        
        return need + res
    }
}
