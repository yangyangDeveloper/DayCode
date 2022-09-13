//
//  Solution_17.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/13.
//

import Foundation
// 17. 电话号码的字母组合
class Solution_17 {
    
    var res = [String]()
    var temp = String()
    let dic : [Character:[Character]] = ["1":[],
                                          "2":["a","b","c"],
                                          "3":["d","e","f"],
                                          "4":["g","h","i"],
                                          "5":["j","k","l"],
                                          "6":["m","n","o"],
                                          "7":["p","q","r","s"],
                                          "8":["t","u","v"],
                                          "9":["w","x","y","z"]
                                        ]
    
    func letterCombinations(_ digits: String) -> [String] {
        guard digits != "" else { return [] }
        
        var stack = [[Character]]()

        for char in digits {
            stack.append(dic[char]!)
        }
        backtrack(0, stack)
        return res
    }
    
    func backtrack(_ startIndex: Int, _ stack: [[Character]]) {
        if startIndex == stack.count {
            res.append(temp)
            return
        }
        // [a b c]
        // [d e f]
        // for决定宽度
        for i in 0 ..< stack[startIndex].count {
            temp.append(stack[startIndex][i])
            // 递归深度  用递归控制for循环嵌套的数量
            backtrack(startIndex + 1, stack)
            
            temp.removeLast()
        }
    }
}
