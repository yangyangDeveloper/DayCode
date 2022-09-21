//
//  Solution_114.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/21.
//

/*
   考察点： 二叉树的前序遍历
   思路1： 顺序拼接在一起 其实就是一个链表  可以搞一个亚节点 然后接前序遍历 最后返回 dumpty.next  但是这个题 没有返回值 说明这种写法不行
   思路2： 后序遍历
*/

class Solution_114 {
        
    // 定义level函数输入一个节点x 可以做一下事情
    // 1、可以将x的左子树拉平 利用 level(x.left) 将右子树拉平 利用level(x.right)
    // 2、将x的左子树设置成右子树  然后遍历到右子树末端拼接到 本来的右子树
    func level(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        // 利用定义 把左右子树拉平
        level(root?.left)
        level(root?.right)
        
        // 后序遍历位置
        // 1 左右子树已经被拉平成了一条链表
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
