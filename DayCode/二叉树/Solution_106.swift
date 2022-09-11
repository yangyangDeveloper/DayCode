//
//  Solution_106.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/10.
//

import Foundation

class Solution_106 {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return helper(inorder, postorder, 0, inorder.count - 1,  0 , postorder.count - 1)
    }
    
    func helper(_ inorder: [Int], _ postorder: [Int], _ inorder_left: Int, _ inorder_right:Int, _ postorder_left: Int, _ postorder_right: Int) -> TreeNode? {

        if(inorder_right < inorder_left || postorder_right < postorder_left) {
            return nil
        }
        
        var value = postorder[postorder_right]
        var root:TreeNode? = TreeNode(value)

        // 寻找中序下标
        var index = 0
        for i in inorder_left ... inorder_right {
            if inorder[i] == value {
                index = i
                break
            }
        }
        
        // 中序里面 左右子树长度
        var left_tree_size  = index - inorder_left
        var right_tree_size = inorder_right - index
        root?.left  = helper(inorder, postorder, inorder_left,  index - 1,
                             postorder_left, postorder_left + left_tree_size - 1)
        
        root?.right = helper(inorder, postorder, index + 1, inorder_right,
                             postorder_left + left_tree_size , postorder_right - 1)
        return root
    }
    
}
