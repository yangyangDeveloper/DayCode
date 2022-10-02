//
//  Solution_106.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/10.
//

/*
 
   考察点： 中序 后序 构建二叉树
   中序遍历数组为 inorder[inStart..inEnd]，
   后序遍历数组为 postorder[postStart..postEnd]，
   技巧：
   记边界
   
   左子树就1个 leftsize = 1 index
 
   所有左子树后序区间是  [poststart  poststart + leftsize - 1]   [0, 0]才代表1个元素  不减1  就成了 [0, 1]  2个元素了
   
 */

// 106. 从中序与后序遍历序列构造二叉树
class Solution_106 {
    
    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
         let m = inorder.count
         let n = postorder.count
         return build(inorder, 0, m - 1, postorder, 0, n - 1)
     }

     func build(_ inorder:[Int], _ inStart: Int, _ inEnd: Int, _ postOrder:[Int], _ postStart: Int, _ postEnd: Int) -> TreeNode? {

         if inStart > inEnd {
             return nil
         }
         let rootval = postOrder[postEnd]

         var index = 0
         for i in 0..<inorder.count {
             if rootval == inorder[i] {
                 index = i
             }
         }
         // 划分左右子树节点
         var leftSize = index - inStart
         var root: TreeNode? = TreeNode(rootval)

         // 递归构造左右子树
         root?.left = build(inorder, inStart, index - 1, postOrder, postStart, postStart + leftSize - 1)

         root?.right = build(inorder, index + 1, inEnd,  postOrder, postStart + leftSize, postEnd - 1)

         return root
     }
}
