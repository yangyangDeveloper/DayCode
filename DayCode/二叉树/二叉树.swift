//
//  二叉树.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/21.
//

import Foundation

/*
    快速排序 和 归并排序
 
    快速排序其实就是二叉树的 前序遍历   找出一个分界点p  p的左侧都比他小 p的右侧都比他大  等于我先排列的是p 让p定位
    一句话： 我先把一个元素p排好序 再把剩下的元素排好序
    核心代码
    var p = parttion(nums, left, right)
    sort(nums, left, p - 1)
    sort(nums, p + 1, right)
    
 
    归并排序其实就是二叉树的 后序遍历
    一句话：我想排序一个数组 我先把数组左半部排好序，然后右半部排好序 最后把他俩和起来
    核心代码
    var mid = (left + right) / 2
    sort(nums, left, mid)
    sort(nums, mid + 1, right)
    合并 [left mid] [mid + 1 right]
    merge(nums, left, mid, right)
 
*/

/*
    只要有递归 就会有 前序遍历 和 后序遍历  如果是二叉树 还会有一个 中序遍历
    前序遍历： 刚进入某一个节点时候   也可以理解为函数刚进入时候，就是在调用下一个函数访问下一个元素之前
    后序遍历： 将要离开某一个节点时候  也可以理解为函数马上要结束时候  就是函数最后一行代码
 
 
    为什么多叉树没有中序遍历
    因为二叉树的 每一个节点 都有唯一的 前中后序时机  多叉树的中间节点没有唯一的 中序时机
    中序遍历主要用于 二叉搜索树
 
 
    二叉树的正确认识：
    二叉树所有的问题就是让我们在 前中后序位置 巧妙的加入我们的代码 达到我们的目的
    我只需要思考每一个节点应该做什么 其他的不用管，抛给二叉树的递归遍历框架，递归会在所有节点上做相同的操作
    

    二叉树的递归解法分为两类思路
    1、遍历一遍二叉树得到答案 对应回溯算法
    2、通过分解问题计算出答案 对应动态规划算法
*/



/*
 
 前序遍历和后序遍历的玄妙
 前序遍历 只能通过函数的参数来获取从父节点传来的信息
 后序遍历 站在子结点上理解：除了可以通过函数参数获取信息之外，还可以把本层的结果传递给上层父节点
        站在父节点上理解：不仅可以通过函数参数传递参数，还可以获取子数通过函数返回值传递过来的数据
*/
// 打印出每一个节点所在的层数   前序 后序 都可以干吧   因为他们都可以通过函数获取参数
func traverse(_ root: TreeNode?, _ level: Int) {
    if root == nil {
        return
    }
    print("节点 ==\(root) 第\(level)层")
    traverse(root?.left, level + 1)
    traverse(root?.right, level + 1)
}

// 打印每个节点的左右子树各有多少节点 这个只能后序打印吧
// 因为只有后序位置 才可以通过函数的返回值获取子树传递过来的信息
// 一旦发现题目和子树有关系 大概率要给函数设置合理的定义 和 返回值了  在后序写代码了

func count(_ root: TreeNode?) ->Int {
    if root == nil {
        return 0
    }
    
    let leftcount = count(root?.left)
    let rightcount = count(root?.right)
    print("节点\(root)的左子树节点个数=\(leftcount) 右子树节点个数=\(rightcount)")
    return leftcount + rightcount + 1
}


