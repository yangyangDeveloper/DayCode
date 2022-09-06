//
//  Sof27.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/6.
//

import Foundation

// 剑指 Offer 27. 二叉树的镜像
class Sof27 {
    
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        var queue = [TreeNode]()
        queue.append(root!)
        
        while queue.count > 0 {
            var temp = queue.removeFirst()
            var left = temp.left
            temp.left = temp.right
            temp.right = left
            
            if let left = temp.left {
                queue.append(left)
            }
            
            if let right = temp.right {
                queue.append(right)
            }
        }
        return root
    }
}
