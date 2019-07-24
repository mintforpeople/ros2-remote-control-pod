//
//  Int16StatusTopic.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 4/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class Int16StatusTopic: AStatusTopic {
    
    private var publisher = ROSPublisher<ROS_std_msgs_msg_Int16>()
    private var int16Node = ROSNode()
    private var rclObjC = ROSRCLObjC.self
    
    public func getNode() -> ROSNode{
        return self.int16Node
    }
    
    public init(node: StatusNode, nodeName: String, topicName: String, statusName: String, valueKey: String) {
        super.init(node: node, topicName: topicName, statusName: statusName, valueKey: valueKey)
        self.int16Node = self.rclObjC.createNode(nodeName)
    }
    
    public override func start() {
        self.publisher = self.getNode().createPublisher(ROS_std_msgs_msg_Int16.self, self.getTopicName()) as! ROSPublisher<ROS_std_msgs_msg_Int16>
    }
    
    public override func publishStatus(status: Status) {
        
        if status.getName() == self.getSupportedStatus() {
            let msg = ROS_std_msgs_msg_Int16()
            let level = status.getValue()[self.valueKey]
            
            if level != "" {
                msg.data = Int16(level!)! //revisar esto
                self.publisher.publish(msg)
            }
        }
    }
}

