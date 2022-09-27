//
//  Solution_253.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//


/*
   考察点： 开始时间抽离到一个数组  结束时间抽离到一个数组 然后 排序
   双指针 i j  如果 开始时间< 结束时间  会议室+ 1  i+1  如果遇到 开始时间 > 结束时间  会议室 -1
 
 */
// 253. 会议室 II
class Solution_253 {
    
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 0 else {
            return 0
        }
        let n = intervals.count
        
        var begin = [Int](repeating: 0, count: n)
        var end = [Int](repeating: 0, count: n)
        
        for i in 0..<n {
            begin[i] = intervals[i][0]
            end[i] = intervals[i][1]
        }
        
        begin = begin.sorted()
        end = end.sorted()
        
        // 开始扫描
        var count = 0
        var res = 0
        var i = 0
        var j = 0
        
        while i < n && j < n {
            if begin[i] < end[j] {
                //  扫描到红点
                count += 1
                i += 1
            }else {
                // 扫描到旅店
                count -= 1
                j += 1
            }
            
            res = max(res, count)
        }
        
        return res
    }
    
    // 维护一个结束时间数组， 找到了开始时间晚于结束时间 就可以服用， 更新一下结束时间，  如果不行就 自己开一个房间
    func minMeetingRooms2(_ intervals: [[Int]]) -> Int {
        // 按照排序
        guard intervals.count > 0 else {
            return 0
        }
        
        // 按照会议开始时间升序排列
        var intervals = intervals.sorted(by: { $0[0] < $1[0]})
        var rooms = [Int]()
        
        for i in 0..<intervals.count {
            var start = intervals[i][0]
            
            var isfind = false
            
            for j in 0..<rooms.count {
                
                // 找到结束时间
                var end = rooms[j]
                // 可以服用
                if end <= start {
                    isfind = true
                    rooms[j] = intervals[i][1]
                    break
                }
                
                if !isfind {
                    rooms.append(intervals[i][1])
                }
            }
        }
        return rooms.count
    }
}
