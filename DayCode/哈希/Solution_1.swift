//
//  Solution_1.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/17.
//

/*
   考察点： hashmap
   数组其实可以理解为一个「索引 -> 值」的哈希表映射
   我们需要建立一个「值 -> 索引」的映射即可完成此题
*/

class Solution_1 {
    /*
        hashmap {key：数据元素，value：数组元素对应的下表}。
    */
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // key是值  value是索引
        var hashmap = [Int:Int]()
        for i in 0..<nums.count {
            let need = target - nums[i]   // 查询是否有need这个值
            if hashmap.keys.contains(need) {
                if let k = hashmap[need] {
                    return [i, k]  
                }
            }else {
                hashmap[nums[i]] = i
            }
        }
        return [-1, -1]
    }
}
