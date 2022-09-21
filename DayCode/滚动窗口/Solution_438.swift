//
//  Solution_438.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/21.
//

class Solution_438 {
    /*
       这道题是 567题的稍微升一下级  套路是一样的
       那个是找到返回 true fasle  这个是有多个  找到就把每一个的开始索引记录下来
    */
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var p = p.map({String($0)})

        // 匹配的规则
        var need = [String: Int]()
        for c in p {
            need[c, default: 0] += 1
        }

        // 记录窗口数据
        var windows = [String: Int]()

        var left = 0
        var right = 0

        //window和need匹配的个数
        var valid = 0

        var s = s.map({String($0)})

        // 收集结果
        var res = [Int]()

        while right < s.count {
            // 将来进入窗口
            var c = s[right]
            // 窗口增大
            right += 1
            // 更新数据
            if let t = need[c] {
                windows[c,default:0] += 1
                if windows[c] == need[c] {
                    valid += 1
                }
            }

            // 缩小窗口
            while right - left >= p.count {
                
                // 完全符合
                if valid == need.count {
                    // 记录当前开始下表
                    res.append(left)
                }

                // 将来离开窗口的字符
                var d = s[left]
                // 窗口缩小
                left += 1

                // 更新操作
                if let t = need[d] {
                    if windows[d] == need[d] {
                        valid -= 1
                    }
                    windows[d, default:0] -= 1
                }
            }
        }
        
        return res
    }
}
