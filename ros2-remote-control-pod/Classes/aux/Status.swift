//
//  Status.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 4/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import UIKit

public class Status: Value {
    private var name:String
    
    public init(_ name:String) {
        self.name = name
        super.init()
    }
    
    
    
    public func getName() -> String{
        return name
    }
}
