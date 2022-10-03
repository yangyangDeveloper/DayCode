//
//  Solution_1905.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/25.
//

/*
   考察点：  2次dfs
   
   第一次遍历： grid2中是1  但是grid1中是0  这个岛屿肯定不是子岛，淹掉
   第二次遍历： grid2剩下的岛屿就是子岛屿
   
   因为是求的岛屿的个数
   2层for循环里面写 {
        res += 1
        dfs()
   }
   
   如果是求岛屿面积呢  每一个岛屿面积 等于 1 + dfs上下左右
   for循环 {
        res = max(res, dfs())
   }
   
   求内部飞地 相当于求内部的 陆地个数
   1、需要淹没边界
   2、for循环直接{
        res += 1
        不需要dfs了  dfs是求的岛屿
    }
    
   
 */
// 1905. 统计子岛屿
class Solution_1905 {
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        let m = grid2.count
        let n = grid2[0].count
        var grid1 = grid1
        var p2 = grid2
        
        // 不符合的直接淹没   就是grid1是水 grid2是陆地的 直接干掉   必须是  gird是陆地  grid2是陆地或者是水才符合子岛屿
        for i in 0..<m {
            for j in 0..<n {
                if grid1[i][j] == 0 && grid2[i][j] == 1 {
                    // 这个岛屿肯定不是子岛，淹掉
                    dfs(&p2, i, j)
                }
            }
        }
        
        var res = 0
        // 第一次遍历  查询岛屿个数
        for i in 0..<m {
            for j in 0..<n {
                if p2[i][j] == 1 {
                    res += 1  // res统计的是 一共有几片岛屿
                    dfs(&p2, i, j)  // 这里面转悠一圈 遍历完一圈岛屿就出来了  遍历过程中不断的修改的p2数组
                }
            }
        }
        
        
        func dfs(_ grid2: inout [[Int]], _ i: Int, _ j: Int) {
            if i < 0 || j < 0 || i >= m || j >= n {
                return
            }
            
            if grid2[i][j] == 0 {
                return
            }
            
            // 淹没
            grid2[i][j] = 0
            
            dfs(&grid2, i + 1, j)
            dfs(&grid2, i - 1, j)
            dfs(&grid2, i, j - 1)
            dfs(&grid2, i, j + 1)
        }
        
        return res
    }
}
