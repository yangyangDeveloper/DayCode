//
//  Solution_114.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/21.
//

/*
   考察点： 二叉树的递归 [分解问题] 思维
 
   思路1： 前序遍历就是这个链表 收集结点值 然后创建链表  但是很low
   思路2： 分解问题 充分利用递归函数定义
 
 二叉树的递归分为「遍历」和「分解问题」两种思维模式
 分解问题：
 明确递归函数的定义，然后利用这个定义

 1、将 root 的左子树和右子树拉平。
 2、将 root 的左子树作为右子树 记录原本的右子树
 3、讲原本的右子树 拼接到 当前右子树下边
 
*/

class Solution_114 {

    // 定义： 讲以root为根节点的树拉平为链表
    func flatten(_ root: TreeNode?) {
        if root == nil {
            return
        }

        // 先递归拉平左右子树 怎么啦平的不用你管 教给递归函数
        flatten(root?.left)
        flatten(root?.right)

        // 1、左右子树已经被拉平成一条链表
        var left = root?.left
        var right = root?.right

        // 2、将左子树作为右子树
        root?.left = nil
        root?.right = left

        // 3、将原先的右子树接到当前右子树的末端
        var p = root
        while p?.right != nil {
            p = p?.right
        }
        p?.right = right
    }
}
