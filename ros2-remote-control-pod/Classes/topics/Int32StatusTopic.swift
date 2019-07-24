//
//  Int32StatusTopic.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 4/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class Int32StatusTopic: AStatusTopic {
    private var publisher = ROSPublisher<ROS_std_msgs_msg_Int32>()
    private var int32Node = ROSNode()
    private var rclObjC = ROSRCLObjC.self
    
    public func getNode() -> ROSNode{
        return self.int32Node
    }
    
    public init(node: StatusNode, nodeName: String, topicName: String, statusName: String, valueKey: String) {
        super.init(node: node, topicName: topicName, statusName: statusName, valueKey: valueKey)
        self.int32Node = self.rclObjC.createNode(nodeName)
    }
    
    public override func start() {
        self.publisher = self.getNode().createPublisher(ROS_std_msgs_msg_Int32.self, self.getTopicName()) as! ROSPublisher<ROS_std_msgs_msg_Int32>
    }
    
    public override func publishStatus(status: Status) {
        
        if status.getName() == self.getSupportedStatus() {
            var msg = ROS_std_msgs_msg_Int32()
            var level: String = status.getValue()[self.valueKey]!
            
            if level != "" {
                msg.data = Int32(level)! //revisar esto
                self.publisher.publish(msg)
            }
        }
    }
}


