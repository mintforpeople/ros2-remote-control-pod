//
//  IStatusTopic.swift
//  Talker
//
//  Created by Lorena Bajo Rebollo on 3/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation


public protocol IStatusTopic {
    
    func getSupportedStatus() -> String
    
    func getTopicName() -> String
    
    func publishStatus(status: Status)
    
    func start()
    
}
