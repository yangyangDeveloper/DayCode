//
//  Solution_146.swift
//  LeetCode100
//
//  Created by zhangyangyang on 2022/10/15.
//

import Foundation

/*
    双链表  + hashmap

    链表：
    1、添加
    2、删除
    3、移除第一个元素
    4、长度

    4个辅助函数：

    升级为最近使用  get
     
    添加进去  put
    移除某个key   如果已经存在 put辅助函数
    移除最不经常使用的  如果容量满了 put辅助函数

    get{
        map不存在
            return - 1
        map存在
            makeRecently   提升等级
    }

    put {
        1、key已经存在
            删除旧的 hash 移除这个节点
            创建addRecently
            return
        2、key不存在 需要建立新的node
            如果容量满了  首先要删除最近不经常使用的 removeLastRecently
            创建addRecently
    }


    容量为2
    LRUCache cache = new LRUCache(2);
    // 你可以把 cache 理解成一个队列
    // 假设左边是队头，右边是队尾
    // 最近使用的排在队头，久未使用的排在队尾

    cache.put(1, 1);
    // cache = [(1, 1)]



    cache.put(2, 2);
    // cache = [(2, 2), (1, 1)]


    cache.get(1);    // 返回 1
    因为最近访问了1 所以把1 提取到最前面
    // cache = [(1, 1), (2, 2)]

    cache.put(3, 3); // 超出容量2了
    cache = [(3, 3), (1, 1)]


    cache.get(2);       // 返回 -1 (未找到)


    cache.put(1, 4);
    // cache = [(1, 4), (3, 3)]
    // 解释：键 1 已存在，把原始值 1 覆盖为 4
    // 不要忘了也要将键值对提前到队头
*/

class LNode : NSObject {
    public var key: Int
    public var val: Int
    public var next: LNode?
    public var prev: LNode?
    public init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
        self.next = nil
        self.prev = nil
    }
}

// 靠尾部的数据是最近使用的，靠头部的数据是最久未使用的
class DoubleList: NSObject {
    // 头尾虚节点
    var head: LNode?
    var tail: LNode?
    
    // 链表元素数
    var size = 0
    
    override init() {
        head = LNode(0, 0)
        tail = LNode(0, 0)
        head?.next = tail
        tail?.prev = head
        size = 0
    }
    
    // 在链表尾插入节点x
    func addLast(_ x: LNode?) {
        x?.prev = tail?.prev
        x?.next = tail
        tail?.prev?.next = x
        tail?.prev = x
        size += 1
    }
    
    // 删除链表中的x节点 (x 一定存在)
    func remove(_ x: LNode?) {
        x?.prev?.next = x?.next
        x?.next?.prev = x?.prev
        size -= 1
    }
    
    // 删除链表中第一个节点 并且返回这个节点
    func removeFirst() -> LNode? {
        
        if head?.next == tail {
            return nil
        }
        var first = head?.next
        remove(first)
        return first
    }
    
    func LNodeSize() -> Int {
        return size
    }
}

class LRUCache {
    // key -> Node(key, val)
    var map = [Int: LNode]()
    var cache = DoubleList()
    
    // 最大容量
    var cap = 0
    
    init(_ capacity: Int) {
        cap = capacity
    }
    
    // 添加最近使用的元素
    func addRecently(_ key: Int, _ val: Int) {
        let x = LNode(key, val)
        // 链表拼接到链尾
        cache.addLast(x)
        // map中添加映射
        map[key] = x
    }
    
    // 讲某个key 提升为最近使用
    func makeRecently(_ key: Int) {
        let x = map[key]
        cache.remove(x)
        cache.addLast(x)
    }
    
    // 删除某一个key
    func deleteKey(_ key: Int) {
        let x = map[key]
        cache.remove(x)
        map.removeValue(forKey: key)
    }
    
    // 删除最久未使用的元素
    func removeLeastRecently() {
        // 链表头部的第一个元素就是最久未使用的
        let deletedNode = cache.removeFirst()
        var deletekey = deletedNode?.key
        map.removeValue(forKey: deletekey!)
    }
    
    func get(_ key: Int) -> Int {
        if map[key] == nil {
             return -1
         }
        makeRecently(key)
        return map[key]!.val
    }
    
    func put(_ key: Int, _ value: Int) {
        if map[key] != nil {   // key 已经存在
            // 删除旧的数据
            deleteKey(key)
            // 新插入的数据为最近使用的数据
            addRecently(key, value)
            return
        }
        
        if cap == cache.LNodeSize() {
            // 删除最久未使用的元素
            removeLeastRecently()
        }
        // 添加为最近使用的元素
        addRecently(key, value)
    }
}
