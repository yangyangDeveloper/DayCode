//
//  Solution_105.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/10/2.
//

/*
 
   考察点： 中序 前序 构建二叉树
   中序遍历数组为 inorder[inStart..inEnd]，
   后序遍历数组为 perorder[perStart..perEnd]，
 

basecase:
instart > inend {
   return nil
}
 
统计左子树数量 index - instart
 
左子树
[inStart, index-1]
[preStart + 1  preStart + leftsize]

右子树
[index + 1, inEnd]
[preStart + leftsize + 1  preEnd]
 
*/

// 105. 从前序与中序遍历序列构造二叉树
class Solution_105 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        let m = preorder.count
        let n = inorder.count
        return build(inorder, 0, n - 1, preorder, 0, m - 1)
    }
    
    func build(_ inorder: [Int], _ inStart: Int,  _ inEnd: Int, _ preorder: [Int], _ preStart: Int, _ preEnd: Int) -> TreeNode? {
        
        if inStart > inEnd {
            return nil
        }
        
        var index = 0
        // 前序第一个位置就是根节点
        let rootvalue = preorder[preStart]
        
        for i in 0..<inorder.count {
            if rootvalue == inorder[i] {
                index =  i
            }
        }
        
        // 划分左右节点
        let leftSize = index - inStart
        
        // 构建二叉树
        let root:TreeNode? = TreeNode(rootvalue)
        root?.left = build(inorder, inStart, index - 1, preorder, preStart + 1, preStart + leftSize)
        root?.right = build(inorder, index + 1, inEnd, preorder, preStart + leftSize + 1, preEnd)
        
        return root
    }
}

