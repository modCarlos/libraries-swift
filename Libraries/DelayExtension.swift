//
//  DelayExtension.swift
//  Libraries
//
//  Created by Carlos Fuentes on 06/02/17.
//  Copyright © 2017 Carlos Fuentes. All rights reserved.
//

import Foundation

///Para llamar funciones after delay como en obj-c
extension NSObject {
    
    func callSelectorAsync(selector: Selector, object: AnyObject?, delay: TimeInterval) -> Timer {
        
        let timer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: selector, userInfo: object, repeats: false)
        return timer
    }
    
    func callSelector(selector: Selector, object: AnyObject?, delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            Thread.detachNewThreadSelector(selector, toTarget:self, with: object)
        }
    }
}
