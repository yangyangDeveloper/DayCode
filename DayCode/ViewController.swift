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
//        let s = "PWWKEW"
//        let n = So48().lengthOfLongestSubstring(s)
        
       // maopaoSort()
        
       // charuSort()
        
//        quickSort()
//        guibingSort()
        
        // test106()
       // test77()
        test131()
//        let t = ["1", "2", "3"]
//        let v = Array(t)
        
    }
    
    func test77() {
       // var t = Solution_77().combine(4, 2)
        var str:String = "hello"
        // 把字符串转为字符数组以便于通过索引访问和取子串
        let s = Array(str)
        let substring = String(s[0 ... 3])
        
    }
    
    func test106() {
        let inorder = [9,3,15,20,7]
        let postorder = [9,15,7,20,3]
        let t = Solution_106().buildTree(inorder, postorder)
        
    }
    
    func test131() {
        let s = "aab"
        let t = Solution_131().partition(s)
    }
    
    // 冒泡排序
    func maopaoSort() {
        let sort = Solution_Sort()
        let nums = [8,1,7,4,5,2,3,6]
        let n = sort.sortArray(nums)
        print("冒泡排序\(n)")
    }
    
    // 选择排序
    func xuanzheSort(){
        let sort = Solution_Sort()
        let nums = [8,1,7,4,5,2,3,6]
        let n = sort.sortArray2(nums)
        print(n)
    }
    
    // 插入排序
    func charuSort() {
        let sort = Solution_Sort()
        let nums = [5,2,3,1]
        let n = sort.charusortArray(nums)
        print(n)
    }
    
    // 快速排序
    func quickSort() {
        let sort = Solution_Sort()
        let nums = [5,1,1,2,0,0]
        let n = sort.quicksortArray(nums)
        print(n)
    }
    
    // 归并排序
    func guibingSort() {
        let sort = Solution_Sort()
        let nums = [5,1,1,2,0,0]
        let n = sort.guibingsortArray(nums)
        print("归并排序\(n)")
    }
}


