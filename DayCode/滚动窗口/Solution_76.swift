//
//  Solution_76.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/20.
//

/*
  左闭右开区间 [left, right) 称为一个「窗口」
  不包含right
  s.removeFirst(start) 删除前3个元素
  let str = s.prefix(len).joined()  抓取4个元素 拼接成字符串
 
 */
class Solution_76 {
    
    // 滑动窗口写
    func minWindow(_ s: String, _ t: String) -> String {
        // 第一步： 记录 t 每个字符出现的次数
        var t = t.map({ String($0)})
        
        var need = [String: Int]() // 字符串条件
        var window = [String: Int]()  // 窗口记录
        
        // 字符串条件
        for char in t {
            need[char, default: 0] += 1
        }
        var tsize = t.count
        var valid: Int = 0 // 有多少个字符满足条件
    
        // 记录最小覆盖子串的起始索引和长度
        var start = 0
        var len = Int.max
    
        var s = s.map({String($0)})
     
        // 滑动窗口模版
        var left = 0
        var right = 0
        while right < s.count {
            
            // 将要进入窗口的字符串
            var c = s[right]
            // 扩大窗口
            right += 1
            
            // 和need 不相关的  窗口滑动也不记录到window里面
            // 如果某一个字符出现的次数相等
            if let t = need[c] {
                window[c, default: 0] += 1
                if window[c] == need[c] {  //  出现次数匹配的话  valid+1  等于符合一个条件
                    valid += 1
                }
            }
            
            // isvaid满足字符串t的所有要求了 我就开始收缩
            while valid == need.count {
                
                // 缩小窗口时候 我们更新答案
                if right - left < len {
                     start = left // 记录本次的左边界
                     len = right - left
                }
                
                // 将要离开窗口的字符串
                var d = s[left]
                // 缩小窗口
                left += 1
                
                // 当我们收缩窗口时候 我们做哪些操作呢
                if let t = need[d] {
                    if window[d] == need[d] {  //即将离开的是我们need中的  那么我们需要把符合条件 -1  同时window也减少
                        valid -= 1
                    }
                    window[d, default: 0] -= 1
                }
            }
        }
        
        
        // 如果 len 为最大值 所有没有找到符合要求的 那么 返回 空
        // 如果 找到了 就通过 start 和 len 返回字符串
        if len != Int.max {
            var s_strt = start
            var s_end = start + len - 1
            var str = s[s_strt...s_end].joined()
            
            // s.removeFirst(start)
            // let str = s.prefix(len).joined()
            
            return str
        }
        return ""
    }
}
