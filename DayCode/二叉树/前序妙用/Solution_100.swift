//
//  Solution_100.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/7.
//

// 100. 相同的树
class Solution_100 {
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        if p == nil || q == nil {
            return false
        }
        
        if p?.val != q?.val {
            return false
        }
        
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right);
    }
}
