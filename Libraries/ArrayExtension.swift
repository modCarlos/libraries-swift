//
//  ArrayExtension.swift
//  Libraries
//
//  Created by Carlos Fuentes on 06/02/17.
//  Copyright © 2017 Carlos Fuentes. All rights reserved.
//

import Foundation

extension Array {
    
    ///Extension para cachar el error indexOutOfArray
    func lookup(index : UInt) throws -> Element {
        if Int(index) >= count {throw
            NSError(domain: "com.sadun", code: 0,
                    userInfo: [NSLocalizedFailureReasonErrorKey:
                        "Array index out of bounds"])}
        return self[Int(index)]
    }
}
