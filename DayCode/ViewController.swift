//
//  ViewController.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/12.
//

import UIKit
class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil }
    init(_ val: Int) { self.val = val; self.next = nil }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next}
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
        var temp = str.first?.asciiValue
        print(temp)
        let s = Solution_49()
        s.groupAnagrams(strs)
        
    }
}


