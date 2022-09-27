//
//  Solution_252.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

// 252. 会议室
class Solution_252 {
    // 模版解法 找count == 1
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        if intervals.count <= 1 {
            return true
        }
        
        // 二维排序
        let n = intervals.count
        
        var begin = [Int](repeating: 0, count: n)
        var end = [Int](repeating: 0, count: n)
        
        for i in 0..<n {
            begin[i] = intervals[i][0]
            end[i] = intervals[i][1]
        }
        
        begin = begin.sorted()
        end = end.sorted()
        
        var count = 0
        var res = 1
        var i = 0
        var j = 0
        while i < n && j < n {
            
            if begin[i] < end[j] {
                // 遇到红点
                count += 1
                i += 1
            }else {
                // 遇到蓝点
                count -= 1
                j += 1
            }
            res = max(res, count)
        }
        
        return res == 1
    }
    
        
    func canAttendMeetings2(_ intervals: [[Int]]) -> Bool {
        if intervals.count <= 1 {
            return true
        }
        
        // 二维排序
        
        var arrs = intervals.sorted(by: {$0[0] < $1[0]})
        
        for i in 1..<intervals.count {
            // 上一个结束时间 > 下一个的开始时间 肯定来不及参加
            if intervals[i-1][1] > intervals[i][0] {
                return false
            }
        }
        return true
    }
}
