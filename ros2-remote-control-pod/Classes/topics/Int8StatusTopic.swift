//
//  Int8StatusTopic.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 4/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class Int8StatusTopic: AStatusTopic {
    
    private var publisher = ROSPublisher<ROS_std_msgs_msg_Int8>()
    private var int8Node = ROSNode()
    private var rclObjC = ROSRCLObjC.self
    
    public func getNode() -> ROSNode{
        return self.int8Node
    }
    
    public init(node: StatusNode, nodeName: String, topicName: String, statusName: String, valueKey: String) {
        super.init(node: node, topicName: topicName, statusName: statusName, valueKey: valueKey)
        self.int8Node = self.rclObjC.createNode(nodeName)
    }
    
    public override func start() {
        self.publisher = self.getNode().createPublisher(ROS_std_msgs_msg_Int8.self, self.getTopicName()) as! ROSPublisher<ROS_std_msgs_msg_Int8>
    }
    
    public override func publishStatus(status: Status) {
        
        if status.getName() == self.getSupportedStatus() {
            let msg = ROS_std_msgs_msg_Int8()
            let level = status.getValue()[self.valueKey]
            
            if level != "" {
                msg.data = UInt8(level!)! //revisar esto
                self.publisher.publish(msg)
            }
        }
        
    }
}
