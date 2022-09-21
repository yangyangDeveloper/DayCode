//
//  滑动窗口.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/20.
//

import Foundation

/*
  滑动窗口算法思想：

  left 和 right 中间的这一段 就是窗口  窗口在字符串上滑动
  left rigt左右指针轮流前进 窗口大小增增减减 窗口不断的向后滑动前进  这就是滑动窗口
  
  思想： 左闭右开  【left right）  left++  right++   每个字符只会进入窗口一次 离开一次 不会重复进入重复离开
  复杂地： time  o(n) 看起来是嵌套 while 循环  其实复杂度不是 n^2   是 n
  细节： 只有 left ++  right++   没有--
  滑动窗口的区间 设计为 左闭右开期间 也就是 [left rigt)   比如 [0, 1)  代表的就是 一个字符   [0, 2) 代表的就是进入窗口的字符是 0 1
  说是滑动窗口 不如说是  前进窗口
 
 
  写算法题 需要思考的几个问题
  1、 什么时候更新right
  2、 什么时候停止更新right  开始更新left
  3、 我们采集数据时候 是在扩张时候 还是收缩时候
 
 
 什么时候用滑动窗口？
 想明白了 就可以用滑动窗口
 1、 什么时候更新窗口
 2、 什么时候收缩窗口
 3、 什么时候收集答案
*/


/*
 滚动窗口的模版
func test {
    var left = 0  right = 0
    while left < str.size {
        
        c是将要进入的窗口的字符   还不在窗口内
        char c = s[right]
        right += 1  // right前进
        
        。。。。。 做一些操作
        
        while (需要收缩) {
            char d = s[left] // 即将要离开窗口的字符
            left += 1
            。。。  进行一些窗口内的数据更新
        }
    }
}

 注意收缩窗口的条件
 什么时候 while right - left >= p.count
 什么时候 while vavid == need.count
 
*/


func test2() {
    
    var need = [String: Int]()
    var window = [String: Int]()
    var c = ""
    need[c, default: 0] += 1
    window[c,default: 0] += 1
    
    
}


/*
 
  刷题路线
  76、 最小覆盖子串
    这个可以熟悉滑动窗口的模版和思想  这个窗口大小是会变化的
   
  567、 字符串的排列
    这个比之前的简单 窗口是固定大小的 可以套用之前的模版
 
  438、  找到字符串中素有所有字母异位词
    这个比之前的567 稍微复杂一点  套路之前的模版  只是记录下表就可以了  只是记录left的下表

 */
