//
//  Solution_752.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/23.
//

/*
   考察点： bfs 遍历
   思路： 每一次波动有8种状态  每种状态有对应8种  但是会有重复的 需要去除
   然后就是套 bfs框架
 
 */
// 752. 打开转盘锁
class Solution_752 {
    
    func openLock(_ deadends: [String], _ target: String) -> Int {
        // 波动密码的次数
        var step = 0
        var queue = [String]()
        queue.append("0000")
        var visited:Set<String> = ["0000"] // 进入过队列的字符串
        
        while queue.count > 0 {
            for i in 0..<queue.count {
                
                var cur = queue.removeFirst()
                
                // 发现有重复的跳出 
                if deadends.contains(cur) {
                    continue
                }
                // 找到了结果
                if cur == target {
                    return step
                }
                
                // 中心扩展 都装入队列
                // 将一个节点下 未遍历的相邻节点都装入队列
                for i in 0..<4 {
                    let plus = plusOne(cur, i)
                    let minus = minusOne(cur, i)
                    if !visited.contains(plus) {
                        queue.append(plus)
                        visited.insert(plus)
                    }
                    if !visited.contains(minus) {
                        queue.append(minus)
                        visited.insert(minus)
                    }
                }
            }
            // 增加步数
            step += 1
        }
        // 如果穷举完 没有找到结果 那就是找不到了
        return -1
    }
    
    func plusOne(_ str: String, _ i: Int) -> String {
        var chars = [Character](str)
        if chars[i] == "9" {
            chars[i] = "0"
        } else {
            if let numValue = chars[i].wholeNumberValue {
                chars[i] = Character("\(numValue + 1)")
            }
        }
        return String(chars)
    }

    func minusOne(_ str: String, _ i: Int) -> String {
        var chars = [Character](str)
        if chars[i] == "0" {
            chars[i] = "9"
        } else {
            if let numValue = chars[i].wholeNumberValue {
                chars[i] = Character("\(numValue - 1)")
            }
        }

        return String(chars)
    }

}
