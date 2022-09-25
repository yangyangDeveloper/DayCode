//
//  Solution_1020.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/25.
//

/*
    考察点： 回溯二维
    把边界岛屿淹没 然后剩下的就是内陆岛 然后res +1  就是面积  
 */

// 1020. 飞地的数量
class Solution_1020 {
    
    func numEnclaves(_ grid: [[Int]]) -> Int {
        var grid = grid
        var res = 0
        let m = grid.count
        let n = grid[0].count
        
        // 淹没边界
        for j in 0..<n {
            dfs(&grid, 0, j)
            dfs(&grid, m - 1, j)
        }
        
        for i in 0..<m {
            dfs(&grid, i, 0)
            dfs(&grid, i, n - 1)
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    res += 1
                }
            }
        }
        
        func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int) {
            // base case  越界
            if i < 0 || i >= m || j < 0 || j >= n {
                return
            }
            
            if grid[i][j] == 0 {
                return
            }
            
            grid[i][j] = 1
            
            dfs(&grid, i + 1, j)
            dfs(&grid, i - 1, j)
            dfs(&grid, i, j - 1)
            dfs(&grid, i, j + 1)
        }
        return res
    }
}
