//
//  Solution_22.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/27.
//

/*
 
    考察点： 回溯穷举
    
    left记录还可以使用的（数量
    right记录 还可以使用的) 数量
 
 
    basecase
    if  left > right 就非法   细节：  左括号剩下的多 肯定不合法  任意位置 左括号都要大于右括号数量  那么 左括号剩余的就要小于右括号
    
    if left right 是负的 return
 
    if left right ==0了 那么 就 收集答案  return
 

    尝试拼接（
    backtrace（left -1 right, path, res）
    撤销拼接


    尝试拼接）
    backtrace（left right -1, path, res）
    撤销拼接

*/

// 22. 括号生成
class Solution_23 {
    

    func generateParenthesis(_ n: Int) -> [String] {
        if n == 0 {
            return []
        }
        var res = [String]()
        var path = String()
        backtrace(n, n, &path, &res)
        return res 
    }
    
    func backtrace(_ left: Int, _ right: Int,  _ path: inout String, _ res: inout [String]) {
        
        // 若左括号剩下的多，说明不合法 (一定要注意 左括号剩下的多 这句话)
        if left < right {
            return
        }
        
        // 数量小于 0 肯定是不合法的
        if left < 0 || right < 0 {
            return
        }
        
        // 当所有括号都恰好用完时，得到一个合法的括号组合
        if left == 0  && right == 0 {
            res.append(path)
            return
        }
    
        path.append("(")
        backtrace(left - 1, right, &path, &res)
        path.removeLast()
        
        
        path.append(")")
        backtrace(left, right - 1, &path, &res)
        path.removeLast()
    }
}
