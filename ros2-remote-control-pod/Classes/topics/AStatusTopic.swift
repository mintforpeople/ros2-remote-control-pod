//
//  AStatusTopic.swift
//  Talker
//
//  Created by Lorena Bajo Rebollo on 3/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class AStatusTopic: IStatusTopic {
    
    private final var statusName: String
    private final var topicName: String
    internal final var valueKey: String
    
    internal var node: StatusNode
    
    public init(node: StatusNode, topicName: String, statusName: String, valueKey: String) {
        self.node = node
        self.statusName = statusName
        self.topicName = topicName
        self.valueKey = valueKey
    }
    
    
    public func start(){
        
    }
    
    public func getSupportedStatus() -> String{
        return self.statusName
    }
    
    public func getTopicName() -> String {
        return self.topicName
    }
    
    public func publishStatus(status: Status){
        
    }
    
    
}
