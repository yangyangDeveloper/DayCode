//
//  Solution_116.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/21.
//

/*
   
   考察点：二叉树递归  遍历思维模式
   抽象成3叉树 然后使用递归遍历思维
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

    // 二叉树递归 遍历思维模式  抽象成三叉树的一个节点
    func connect(_ root: Node?) -> Node? {
        if root == nil {
            return nil
        }
        // 遍历三叉树 链接相邻节点
        traverse(root?.left, root?.right)
        return root
    }

    // 三叉树框架
    func traverse(_ left: Node?, _ right: Node?) {
        if left == nil || right == nil {
            return
        }

        left?.next = right

        // 递归遍历所有节点 抽象成3叉树
        traverse(left?.left, left?.right)
        traverse(left?.right, right?.left)
        traverse(right?.left, right?.right)
    }

}
