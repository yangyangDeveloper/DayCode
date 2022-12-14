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


class TreeNodeHelper{
    var array:[String]
    var index = -1
    
    init(_ array:[String]) {
        self.array = array
    }
    
//    // 创建一颗二叉树
//    func createTree() -> TreeNode? {
//
//        self.index = self.index + 1
//        if index < self.array.count && index >= 0 {
//
//            let value = self.array[index]
//
//            if value == "" {
//                return nil
//            } else {
//                let note = TreeNode(value)
//                note.leftChild = createTree()
//                note.rightChild = createTree()
//                return note
//            }
//        }
//        return nil;
//    }
//
    
//    func lowestCommendAnc(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> ListNode? {
//        if root == nil {
//            return nil
//        }
//        
//        if root === p || root === q {
//            return root
//        }
//        let left = lowestCommendAnc(root?.left, p, q)
//    }
    
}







class ViewController: UIViewController {
    
    
//    //创建二叉树
//    func createTree() -> TreeNode? {
//
//        self.index = self.index + 1
//        if index < self.array.count && index >= 0 {
//
//            let value = self.array[index]
//
//            if value == "" {
//                return nil
//            } else {
//                let note = BinaryTreeNote(value)
//                note.leftChild = createTree()
//                note.rightChild = createTree()
//                return note
//            }
//        }
//        return nil;
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var str1 = "hello"
        // substring to就是要多长
        var str2 = String(str1.prefix(1))
        print(str2)
        
        //链表
        // testLikedList()
        
         //testArray()
        // testPreSum()
        // testWindows()
        // testArraySort()
        // testpailie()
        // testdp()
        // testTX()
        
        // 数学规律
        //testSX()
        
        // 经典面试题
        //testMS()
    }
    
    // 临时代码
    func temp() {
        var str:String = "A"
        var strs = ["eat","tea","tan","ate","nat","bat"]
        var temp = str.first?.asciiValue
        print(temp)
    }

    func test55() {
        let n = [2,3,1,1,4]
        let t = Solution_55().canJump(n)
    }
    
    func test53_2() {
        let nums = [1]
        let t = Solution_53_2().maxSubArray(nums)
        
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
    
   
}
// MARK: -  数组
extension ViewController {

    func testArray() {
        test5()
        //test34()
        //test54()
        //test523()
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
    
    // 快慢指针
    func test26() {
        
    }
    
    func test27() {
        
    }
    
    func test283() {
        
    }
    
    // 左右指针
    func test167() {
        
    }
    
    func test344() {
        
    }
    
    func test5() {
        let s = "babad"
        let t = Solution_5().longestPalindrome(s)
    }
}

// MARK: -  数组排序
extension ViewController {
    
    func testArraySort() {
        //test912()
        
        // 冒泡排序
        // bubbleSort()
        
        // 选择排序
        selSort()
        
        // 插入排序
        insertSort()
        
        // 快速排序
        // quickSort()
        
        // 归并排序
        //mergeSort()
    }
    
    // 归并排序
    func test912() {
        var nums = [5,2,3,1]
        var res = Solution_912().sortArray2(nums)
    }
    
    // 冒泡排序
    func bubbleSort() {
        let sort = Solution_Sort()
        let nums = [8,1,7,4,5,2,3,6]
        let n = sort.bubbleSort(nums)
        print("冒泡排序\(n)")
    }
    
    // 选择排序
    func selSort(){
        let sort = Solution_Sort()
        let nums = [8,1,7,4,5,2,3,6]
        let n = sort.selSort(nums)
        print(n)
    }
    
    // 插入排序
    func insertSort() {
        let sort = Solution_Sort()
        let nums = [5,2,3,1,99,15,18,2,5,9]
        let n = sort.insertSort(nums)
        print(n)
    }
    
    // 快速排序
    func quickSort() {
        let sort = Solution_Sort()
        let nums = [5,1,1,2,6,4,11,2]
        let n = sort.quicksortArray(nums)
        print(n)
    }
    
    // 归并排序
    func mergeSort() {
        let sort = Solution_Sort()
        let nums = [1,2,6,4,5]
        let n = sort.guibingsortArray(nums)
        print("归并排序\(n)")
    }
}


// MARK: -  链表
extension ViewController {
    func testLikedList() {
        // 反转链表
        //test206()
        //test92()
        test234()
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
    
    func test92(){
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
        
        let t = Solution_92().reverseBetween(nod1, 2, 5)
        
        
    }
    
    func test234() {
        var nod1 = ListNode(1)
        var nod2 = ListNode(2)
        var nod3 = ListNode(3)
        var nod4 = ListNode(2)
        var nod5 = ListNode(1)
        nod1.next = nod2
        nod2.next = nod3
        nod3.next = nod4
        nod4.next = nod5
        nod5.next = nil
        let t = Solution_234().isPalindrome5(nod1)
    }
}

// MARK: -  前缀和 分差数组
extension ViewController {
    func testPreSum() {
        test1()
        test523()
    }
    
    
    func test1() {
        let nums = [2,11,7,15]
        let target = 9
        let t = Solution_1().twoSum(nums, target)
    }
    
    func test523() {
        let nums = [23,2,4,6,7]
        let k = 6
        var t = Solution_523().checkSubarraySum(nums, 6)
    }
}

// MARK: -  滑动窗口
extension ViewController {
    
    // 滑动窗口
    func testWindows() {
        //test76()
        //test567()
        //test438()
        //test3()
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
   
    func test438() {
        let s = "cbaebabacd"
        let p = "abc"
        let res = Solution_438().findAnagrams(s, p)
    }
    
    func test3() {
        let s = "pwwkew"
        let res = Solution_3().lengthOfLongestSubstring2(s)
    }
}

// MARK: -  二分搜索
extension ViewController {
    
}

// MARK: -  二叉树
extension ViewController {
    
}


// MARK: -  贪心
extension ViewController {
    // 区间问题
    func testTX() {
        //test435()
        //test1288()
        test56()
    }
    
    func test435() {
        let t = [[1,2],[2,3],[3,4],[1,3]]
        let res = Solution_435().eraseOverlapIntervals(t)
        
    }
    
    func test1288() {
        let t = [[1,4],[2,3]]
        let res = Solution_1288().removeCoveredIntervals(t)
        
    }
    
    
    func test56() {
        let t = [[1,3],[2,6],[8,10],[15,18]]
        let res = Solution_56().merge(t)
    }
}

// MARK: -  动态规划
extension ViewController {
    
    func testdp() {
        //test121()
        //test53()
        //test712()
        test516()
    }
    
    func test121() {
        let num = [7,1,5,3,6,4]
        let n = Solution_121().maxProfit(num)
    }
    
    func test53() {
        let nums = [-2,1]
        let t = Solution_53().maxSubArray5(nums)
            
    }
    
    func test712() {
        let s1 = "qbdoebkmpnk"
        let s2 = "vhzwzoougxe"
        let t = Solution_712().minimumDeleteSum2(s1, s2)
        
    }
    
    func test516() {
        let t = "bbbab"
        let res = Solution_516().longestPalindromeSubseq(t)
        
    }
}

// MARK: -  回溯
extension ViewController {
    
    
}


// MARK: -  排列组合子集系列
extension ViewController {
    func testpailie() {
        test77()
    }
    
//    func test77() {
//       // var t = Solution_77().combine(4, 2)
//        var str:String = "hello"
//        // 把字符串转为字符数组以便于通过索引访问和取子串
//        let s = Array(str)
//        let substring = String(s[0 ... 3])
//    }
    
    func test77() {        
        let n = 4
        let k = 2
        let t = Solution_77().combine(4, 2)
        
    }
    
}

// MARK: -  股票买卖系列
extension ViewController {
    
    
}

// MARK: -  岛屿系列
extension ViewController {
    
    
}


// MARK: -  背包
extension ViewController {
    
    
}


// MARK: -  数学规律

extension ViewController {
    func testSX() {
        test319()
    }
    
    func test319() {
        let a = Int(4.7)
        let t = Solution_319().bulbSwitch(6)
        
        
    }
}

// MARK: -  经典面试
extension ViewController {
    func testMS() {
        //test43()
        //test391()
        //test969()
        test887()
    }
    
    func test43() {
       let num1 = "0"
       let num2 = "0"
       let t = Solution_43().multiply(num1, num2)
    }
    
    func test391() {
        
        let rectangles =
        [[0,0,1,1],[0,1,3,2],[1,0,2,2]]
        let t = Solution_391().isRectangleCover(rectangles)
        
    }
    
    func test969() {
        let t = [3,2,4,1]
        let res = Solution_969().pancakeSort(t)
    }
    
    func test887() {
        let k = 1, n = 2
        let res = Solution_887().superEggDrop(k, n)
    }
}
