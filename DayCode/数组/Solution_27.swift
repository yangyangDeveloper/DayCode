//
//  Solution_27.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/19.
//


/*
  考察点； 依然是数组中的快慢指针技巧 [0 slow]   原地修改数组
  类似题目：
  
 
  重复的留下一个
  1、 26、删除有序数组中的重复项     数组
  2、 83. 删除排序链表中的重复元素   链表
  
 
  和val重复的一个不留
  3、 27. 移除元素   数组
  
  细节区别：
         27题
         if nums[fast] != val {
             //  这里先赋值 在移动指针   【0 slow-1】 是结果
             nums[slow] = nums[fast]
             slow += 1
         }
         
         26题
         if nums[fast] != nums[slow] {
             // 先移指针 slow + 1   再赋值    【0 slow】是结果
             slow += 1
             nums[slow] = nums[fast]
         }
*/

// 27. 移除元素
class Solution_27 {
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var slow = 0
        var fast = 0
        
        while fast < nums.count {
            if nums[fast] != val {
                // 注意这里先赋值 在++  保证 【0 slow-1】 都不包含 val
                nums[slow] = nums[fast]
                slow += 1
            }
            
            fast += 1
        }
        
        return slow
    }
}
