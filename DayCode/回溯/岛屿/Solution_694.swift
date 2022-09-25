//
//  Solution_694.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/25.
//

/*
    考察点：
    遍历序列化 + set
    
    前序位置 1 2 3 4 代表  上左下右
    遍历顺序按照 上左下右进行
    后序位置 -1 -2 -3 -4 代表撤销上  撤销左 撤销下 撤销右
    
    加入set set个数就是不同岛屿
 
*/
// 694. 不同岛屿的数量
class Solution_694 {
   
    // 如果我用分别用 1, 2, 3, 4 代表上下左右，用 -1, -2, -3, -4 代表上下左右的撤销，那么可以这样表示它们的遍历顺序：
    // 2, 4, 1, -1, -4, -2
    func numDistinctIslands(_ grid: [[Int]]) -> Int {
        
        var path: String
        let m = grid.count
        let n = grid[0].count
        var grid = grid

        var res:Set<String> = Set<String>()
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    // 淹没这个岛屿 同时记录淹没岛屿的序列化结果
                    //初始的方向可以随便写，不影响正确性
                    var sb = String()
                    dfs(&grid, i, j, &sb, "666")
                    res.insert(sb)
                }
            }
        }
       
        func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int, _ sb: inout String, _ dir: String) {
            if i < 0 || j < 0  || i >= m || j >= n {
                return
            }
            
            if grid[i][j] == 0 {
                return
            }
            grid[i][j] = 0
            
            // 前序位置
            sb.append(dir)
            sb.append(",")

            dfs(&grid, i - 1, j, &sb, "1") // 上
            dfs(&grid, i + 1, j, &sb, "2") // 下
            dfs(&grid, i, j - 1, &sb, "3") // 左
            dfs(&grid, i, j + 1, &sb, "4") // 右
            
            // 后序位置
            sb.append("-")
            sb.append(dir)
            sb.append(",")
        }
        
        return res.count
    }
}
