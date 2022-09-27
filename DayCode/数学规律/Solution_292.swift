//
//  Solution_292.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/27.
//

// 292. Nim 游戏
class Solution_292 {
    // 我遇到 4的倍数 我输
    func canWinNim(_ n: Int) -> Bool {
        // 如果上来就踩到 4 的倍数，那就认输吧
        // 否则，可以把对方控制在 4 的倍数，必胜
        if n % 4 == 0 {
            return false
        }else {
            return true
        }
        //return n % 4 != 0
    }
}
