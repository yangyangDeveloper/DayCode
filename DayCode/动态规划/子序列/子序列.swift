//
//  子序列.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/24.
//

import Foundation

/*
    经典题型
    lis  1个递增子序列
    lcs  两个公共子序列
 
 */
/*
 
 子序列问题
 
 子序列问题本身就相对子串、子数组更困难一些，因为前者是不连续的序列，而后两者是连续的
 
 不要和前面的 回溯里面的 子集数组排序 搞混了  这是子序列
 数组可以有子序列
 字符串也可以有子序列  难就难在 他们可以不连续
 
 一般来说，这类问题都是让你求一个最长子序列，因为最短子序列就是一个字符
 */

/*
 
 子序列2种思路
 
 一维dp
 在子数组 arr[0..i] 中，我们要求的子序列（最长递增子序列）的长度是 dp[i]。
 比如我们写过的
 code300 最长递增子序列 300
 code 53 最大子数组和 53 都是这个思路。
 

 
 二维dp
 尤其是涉及两个字符串/数组的子序列时，比如前文讲的 最长公共子序列 和 编辑距离
 
 1、涉及两个字符串/数组的场景 dp 数组的定义如下：
 在子数组 arr1[0..i] 和子数组 arr2[0..j] 中，我们要求的子序列长度为 dp[i][j]。
 
 2、只涉及一个字符串/数组的场景 dp 数组的定义如下：
 在子数组 array[i..j] 中，我们要求的子序列的长度为 dp[i][j]。
 

 72. 编辑距离
 
 最长公共子序列
 1143. 最长公共子序列
 583. 两个字符串的删除操作
 712. 两个字符串的最小ASCII删除和

 */


/*
 
 674.最长连续递增序列
 300.最长递增子序列

 718.最长重复子数组
 1143.最长公共子序列
 1035.不相交的线
 53.最大子序和
 392.判断子序列
 115.不同的子序列
 583.两个字符串的删除操作
 72.编辑距离
 为了绝杀编辑距离，我做了三步铺垫，你都知道么？
 647.回文子串
 516.最长回文子序列
 动态规划总结篇
 */
