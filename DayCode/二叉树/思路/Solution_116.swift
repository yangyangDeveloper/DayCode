//
//  Solution_116.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/21.
//

/*
   
   考察点： 抽象成3叉树 然后使用递归遍历思维
 */

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

// 116. 填充每个节点的下一个右侧节点指针
class Solution_116 {
    
    // 抽象成3叉树
    // 使用递归遍历 回溯思想 去解决问题
    func connect(_ root: Node?) -> Node? {
        if root == nil {
            return nil
        }
        traverse(root?.left, root?.right)
        return root
    }
    
    // 三叉树的遍历框架
    func traverse(_ left: Node?, _ right: Node?) {
        if left == nil || right == nil {
            return
        }
        // 前序位置插入代码
        left?.next = right
        
        // 3个子节点
        traverse(left?.left, left?.right)
        traverse(left?.right, right?.left)
        traverse(right?.left, right?.right)
    }
}
