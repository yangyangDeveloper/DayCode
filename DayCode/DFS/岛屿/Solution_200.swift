//
//  Solution_200.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/25.
//


/*
    考察点： 网格遍历
*/

// 200. 岛屿数量

class Solution_200 {
    // 遍历
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var res = 0
        let m = grid.count
        let n = grid[0].count

        for r in 0..<m {
            for c in 0..<n {
                // 发现一个岛屿 岛屿数量+1
                if grid[r][c] == "1" {
                    res += 1
                    // 然后使用 DFS 将岛屿淹了
                    dfs(&grid, r, c)
                }
            }
        }

        // 从 (i, j) 开始，将与之相邻的陆地都变成海水
        func dfs(_ grid: inout [[Character]], _ r: Int, _ c: Int) {
            // 越界
            if r < 0 || r >= m || c < 0 || c >= n {
                return
            }

            // 已经是海水了
            if grid[r][c] == "0" {
                return
            }
            
            // 遍历过的设置为0
            grid[r][c] = "0"  //设置为0 是为了不走回头
            // 淹没上下左右的陆地
            dfs(&grid, r - 1, c)
            dfs(&grid, r + 1, c)
            dfs(&grid, r, c - 1)
            dfs(&grid, r, c + 1)
        }
        return res
    }
}
