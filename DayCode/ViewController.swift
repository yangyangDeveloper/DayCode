//
//  ViewController.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/12.
//

import UIKit

// 你可以在集合中存储自定义的类型。这种类型可以是类或者结构体。为了能正常使用集合，该类型必须遵循 hashable 协议。

class ListNode: Hashable {
    var val: Int
    var next: ListNode?
    init(_ val: Int) { self.val = val; self.next = nil }
    var hashValue: Int {
        return val.hashValue ^ next.hashValue
    }
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}

class TreeNode {
    var val: Int
    var left:TreeNode?
    var right:TreeNode?
    init(_ val:Int) {
        self.val = val
    }
}



class ViewController: UIViewController {
    var str:String = "A"
    var strs = ["eat","tea","tan","ate","nat","bat"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //        var temp = str.first?.asciiValue
        //        print(temp)
        //        let s = Solution_49()
        //        s.groupAnagrams(strs)
    
//        let n = Solution_70()
//
//        let t = n.climbStairs(5)
//
//        print(t)
//        let nums = [1,2,3,4]
//        let arr = So21().exchange(nums)
//        let av = nums[2] & 1
//        print(arr)
        let s = "PWWKEW"
        let n = So48().lengthOfLongestSubstring(s)
        
    }
    
    // 十大排序
    func sort() {
        
        // 数组排序
        let sort = Solution_Sort()
        //let nums = [1,4,5,3,2,9,11]
        
        
        let nums2 = [8,1,7,4,5,2,3,6]
        
        // 冒泡排序
        let n = sort.sortArray(nums2)
        print("冒泡排序\(n)")
        
        // 选择排序
        let n2 = sort.sortArray2(nums2)
        print("选择排序\(n2)")
        
        // 插入排序
        let n3 = sort.sortArray3(nums2)
        print("插入排序\(n3)")
 
        // 归并排序
        //let n4 = sort.sortArray4(nums2)
        //print("归并排序\(n4)")
        
        // 快速排序
        let n5 = sort.sortArray5(nums2)
        print("快速排序\(n5)")
        
        
        // 快速排序
        let n6 = sortArray6(nums2)
        print("快速排序2\(n6)")
    }
    
}


// 排序
extension ViewController {
    func sortArray6(_ nums: [Int]) -> [Int] {
        var list = nums
        return quickSort(&list, 0, list.count - 1)
    }
    
    func quickSort(_ nums: inout [Int], _ left:Int, _ r: Int) -> [Int] {

        //  终止条件
        if r <= left {
            return nums
        }

        let q = subSort(&nums, left, r)

        quickSort(&nums, left, q - 1)

        quickSort(&nums, q + 1, r)

        return nums
    }


    func subSort(_ nums:inout [Int], _ l:Int, _ r: Int) -> Int {
        let pivot = nums[r] // 分界值，一般选数组排序区间末尾元素

        var i:Int = l

        // 让  [i 到 j 大于
        // 让  l 到i）小于

        for j in l...r-1 {
            if nums[j] < pivot {
                nums.swapAt(i, j)
                i += 1 // // 有小于pivot的数字
            }
        }

        // 交换 a[i] 与 a[r] 即：将pivot放到相应位置
        nums[r] = nums[i]
        nums[i] = pivot

        return i
    }
}
