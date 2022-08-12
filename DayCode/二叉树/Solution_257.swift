//
//  Solution_257.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/3.
//

// 257. 二叉树的所有路径
class Solution_257 {
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var res = [String]()
        getPaths(root, "", &res)
        return res
    }
    
    func getPaths(_ root: TreeNode?, _ path: String, _ res: inout [String]) {
        if root == nil {return}
        
        var paths = String.init(path)
        paths.append(String(root!.val))
        if root?.left == nil && root?.right == nil {
            res.append(paths)
        }
        
        else {
            paths.append("->")
            getPaths(root?.left, paths , &res)
            getPaths(root?.right, paths , &res)
        }
    }
}

