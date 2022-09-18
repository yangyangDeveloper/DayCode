//
//  Solution_1.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/17.
//

class Solution_1 {
    /*
        1、 明白map是干什么 map里存放我们访问过的元素，判断这个元素是否出现过，如果出现过，返回这个元素的下标   {key：数据元素，value：数组元素对应的下表}。
        2、 明白map里面 数组值为key 小表为value
     */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int:Int]()
        // 我们用数组得值为 key，索引为 value
        for i in 0..<nums.count {
            let t = target - nums[i] // 生成表达式
            if dic.keys.contains(t) {
                if let k = dic[target - nums[i]] {
                    return [i, k]  
                }
            }
            // 存入
            dic[nums[i]] = i
        }
        return [-1, -1]
    }
}
