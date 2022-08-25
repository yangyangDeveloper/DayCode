//
//  Solution_25.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/23.
//


//public ListNode* reverseKGroup(ListNode* head, int k) {
//        int size =0;
//        ListNode* dummyHead = new ListNode(-1, head);
//        ListNode* curr = head;
//        while(curr != nullptr){
//            size++;
//            curr = curr->next;
//        }
//        curr = head;
//        int times = size/k;
//        ListNode* pre_main = dummyHead;
//        for(int i=0; i<times; i++){
//            ListNode* tmp = reverseKNode(pre_main, curr, k);
//            pre_main = tmp;
//            curr = pre_main->next;
//        }
//        return dummyHead->next;
//
//    }
//     ListNode* reverseKNode(ListNode* pre_main, ListNode* head, int k) {
//        ListNode* curr = head;
//        ListNode* pre = nullptr;
//        ListNode* next = nullptr;
//        while(k){
//            k--;
//            next = curr->next;
//            curr->next = pre;
//            pre = curr;
//            curr = next;
//        }
//        head->next = curr;
//        pre_main->next = pre;
//        return head;
//    }


class Soluton_25 {
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var size = 0
        var cur = head
        while cur != nil {
            size += 1
            cur = cur?.next
        }
        
        // 得到反转次数
        var times = size / k
        
        var dumpty = ListNode(-1)
        dumpty.next = head
        var pre = dumpty
        cur = head
        while times > 0 {
            times -= 1
            var temp = reverseKNode(pre, cur, k)
            cur = temp!.next
        }
        
        return dumpty.next
    }
    
    
    func reverseKNode(_ preMain: ListNode?, _ head: ListNode?, _ k:Int) -> ListNode? {
        var cur = head
        var pre:ListNode?
        var next:ListNode?
        var n = k
        while n > 0 {
            n -= 1
            // 记录next
            next = cur?.next
            // 反转
            cur?.next = pre
            
            // 全部往前一步
            pre = cur
            cur = next
        }
        
        // 她的next始终指向头节点
        preMain?.next = pre
        // pre 就是新的头  原本的head 变成了尾
        return pre
    }
}
