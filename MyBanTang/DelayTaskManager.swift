//
//  DelayTaskManager.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/23.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import Foundation

typealias Task = (cancel: Bool) -> Void

class DelayTaskManager {
    
    /**
     延迟执行操作 可取消 调用 cancel(Tas) 取消
     
     - parameter time: 延迟时间
     - parameter task: 要执行的 task
     
     - returns: 可选 task
     */
    func delay(time: NSTimeInterval, task: ()->() ) -> Task? {
        
        func dispatch_later(block: ()->()) {
            dispatch_after(
                dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC))),
                dispatch_get_main_queue(),
                block)
        }
        
        
        var closure: dispatch_block_t? = task
        var result: Task?
        
        let delayedClosure: Task = {
            cancel in
            if let internalClosure = closure {
                if cancel == false {
                    dispatch_async(dispatch_get_main_queue(), internalClosure)
                }
            }
            closure = nil
            result = nil
        }
        
        result = delayedClosure
        
        dispatch_later {
            if let delayedClosure = result {
                delayedClosure(cancel: false)
            }
        }
        return result
    }
    
    /**
     取消延迟执行
     
     - parameter task: 以提交的 task
     */
    func cancle(task: Task?){
        task?(cancel: true)
    }
    
}


