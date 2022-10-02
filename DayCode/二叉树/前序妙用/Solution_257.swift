//
//  Solution_257.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/3.
//

// 257. 二叉树的所有路径
class Solution_257 {
    
    
    var res = [String]()
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var path = String()
        travers(root, path)
        return res
    }
    
    func travers(_ root: TreeNode?, _ path: String) {
        guard let root = root else {
            return
        }
        var tmpPath = path
        tmpPath +=  String(root.val)
        // root 是叶子节点
        if root.left == nil && root.right == nil {
            res.append(tmpPath)
        }else {
            tmpPath += "->"
            travers(root.left, tmpPath)
            travers(root.right, tmpPath)
        }
    }
    
    
    func binaryTreePaths2(_ root: TreeNode?) -> [String] {
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

