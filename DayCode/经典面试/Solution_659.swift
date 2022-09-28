//
//  Solution_659.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/28.
//


/*
 
 // 这题比较特殊 使用2个哈希表来解决
 // freq[v]表示每个数字出现的次数 need[v]表示v可以添加到上一个子串的末尾的次数
 // 在分子序列遍历到某个数字的时候 可能有两种情况
 // 1. 自成一派 自己开头 成为连续3个数字的第一个
 // 2. 和前面的连接上
 // 这两种情况应该优先选择第2种
 
 
    考察点： 斗地主 凑顺子
    1 2 3 3 4 5 6
    

    1 2 3  3 4 5 6
     
 1、当前元素 v 自成一派
 2、当前元素 v 接到已经存在的子序列后面。
 freq 记录每个元素出现的次数  比如 freq[3] == 2 说明元素 3 在 nums 中出现了 2 次
 那么如果我发现 freq[3], freq[4], freq[5] 都是大于 0 的，那就说明元素 3 可以作为开头组成一个长度为 3 的子序列。
 
 need 记录哪些元素可以被接到其他子序列后面。
 比如说现在已经组成了两个子序列 [1,2,3,4] 和 [2,3,4]，那么 need[5] 的值就应该是 2，说明对元素 5 的需求为 2。  5可以拼接到两个子序列的后面。
 
*/
// 659. 分割数组为连续子序列
class Solution_659 {
    func isPossible(_ nums: [Int]) -> Bool {
        if nums.count < 3 {
            return false
        }
        let n = nums.count

        // hashMap 统计数据
        // 每张牌没有被分配的次数   最开始就是他们出现的次数 每用一次 就减去一次
        var freq = [Int: Int]()
        // 被需要的次数
        var need = [Int: Int]()
        
        // 记录每张牌出现的次数
        for v in nums {
            freq[v, default: 0] += 1
        }
        
        for v in nums {
            
            if freq[v, default: 0] == 0 {
                // 已经被用到其他子序列里面了
                continue
            }
            
            // 分派
            if  need[v, default: 0]  > 0 {
                // v 可以接到之前的某个序列后面
                freq[v, default: 0] -= 1
                // 对 v 的需求减一
                need[v, default: 0] -= 1
                // 对 v + 1 的需求加一
                need[v + 1, default: 0] += 1
            } else if freq[v, default: 0] > 0 && freq[v + 1, default: 0] > 0 && freq[v + 2, default: 0] > 0 {
                // 将 v 作为开头，新建一个长度为 3 的子序列 [v,v+1,v+2]
                freq[v, default: 0] -= 1
                freq[v + 1, default: 0] -= 1
                freq[v + 2, default: 0] -= 1
                need[v + 3, default: 0] += 1
            } else {
                // 两种情况都不符合，则无法分配
                return false
            }
        }
        
        return true
    }
}
