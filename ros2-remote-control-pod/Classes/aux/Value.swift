//
//  Value.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 4/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import UIKit

public class Value: NSObject {
    var value:[String:String]
    
    public override init() {
        value = [String:String]()
        value[""]=""
    }
    
    public func putContents(_ key:String, _ val:String){
        value[key] = val
    }
    
    public func getValue() -> [String:String]{
        return value
    }
}
