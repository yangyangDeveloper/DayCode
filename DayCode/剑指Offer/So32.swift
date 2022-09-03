//
//  So32.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/3.
//


class So32 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        var queue = [TreeNode]()
        var res = [[Int]]()
        queue.append(root!)
        
        var isOrderLeft = true
        while queue.count > 0 {
            let size = queue.count
            var arr = [Int]()
            var t = [Int]()
            for i in 0 ..< queue.count {
                // 入队和出列只是在数组的前面或后面，添加或删除元素。
                
                var tempnode:TreeNode = queue.removeFirst()
                if isOrderLeft {
                    arr.insert(tempnode.val, at: 0)
                } else {
                    arr.append(tempnode.val)
                }
                
                if let leftnode = tempnode.left {
                    queue.append(leftnode)
                }
                
                if let rightnode = tempnode.right {
                    queue.append(rightnode)
                }
            }
            
            res.append(arr)
            isOrderLeft = !isOrderLeft
        }
        return res
    }
}
