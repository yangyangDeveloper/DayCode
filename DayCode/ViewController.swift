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
       // test131()
//        let t = ["1", "2", "3"]
//        let v = Array(t)
        
        // test53_2()
        
        //test55()
        //test121()
       // test1()
        
        var presum: [Int: Int] = [:]
       // presum[2] = 0
        //presum[2, default: 100] += 1
        
        var arr = [[1,3],[6,9],[7,6],[4,3]]
        let arr1 = arr[0...2]
        
        
        // testListNode()
        testArray()
    }
    
    
    // MARK: -  测试数组
    func testArray() {
        //test5()
        //test34()
        //test54()
        //test523()
        //test76()
        test567()
    }
    
    func test5() {
        let s = "babad"
        let t = Solution_5().longestPalindrome(s)
    }
    
    func test34() {
        let nums = [2,3,3,3,5,7]
        let s = Solution_34()
        let t = s.searchRange(nums, 1)
    }
    
    
    func test54() {
        let matrix = [[1,2,3],[4,5,6],[7,8,9]]
        var t = Solution_54().spiralOrder(matrix)
        print(t)
    }
    
    func test523() {
        let nums = [23,2,4,6,7]
        let k = 6
        var t = Solution_523().checkSubarraySum(nums, 6)
        
    }
    
    
    func test76() {
        let s = "a"
        let t = "b"
        let res = Solution_76().minWindow(s, t)
        print(res)
    }
    
    func test567() {
 
        let s1 = "abcdxabcde"
        let s2 = "abcdeabcdx"
        
        let res = Solution_567().checkInclusion(s1, s2)
        
    }
    
    // MARK: -  测试链表
    func testListNode() {
        // 反转链表
        test206()
    }
    
    func test206() {
        var nod1 = ListNode(1)
        var nod2 = ListNode(2)
        var nod3 = ListNode(3)
        var nod4 = ListNode(4)
        var nod5 = ListNode(5)
        
        nod1.next = nod2
        nod2.next = nod3
        nod3.next = nod4
        nod4.next = nod5
        nod5.next = nil
        
        let t = Solution_206().reverseList3(nod1)
       
        var cur = t
        while cur != nil {
            print(cur?.val)
            cur = cur?.next
        }
    }
    
    
    
    func test1() {
        let nums = [2,11,7,15]
        let target = 9
        let t = Solution_1().twoSum(nums, target)
        
    }
    
    // 动态规划
    func test121() {
        let num = [7,1,5,3,6,4]
        let n = Solution_121().maxProfit(num)
        
    }
    
    
    func test55() {
        let n = [2,3,1,1,4]
        let t = Solution_55().canJump(n)
        
    }
    
    func test53_2() {
        let nums = [1]
        let t = Solution_53_2().maxSubArray(nums)
        
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


