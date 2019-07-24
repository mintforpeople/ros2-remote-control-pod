//
//  StringStatusTopic.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 4/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class StringStatusTopic: AStatusTopic {
    
    private var publisher = ROSPublisher<ROS_std_msgs_msg_String>()
    private var stringNode = ROSNode()
    private var rclObjC = ROSRCLObjC.self
    
    public func getNode() -> ROSNode{
        return self.stringNode
    }
    
    public override init(node: StatusNode, topicName: String, statusName: String, valueKey: String) {
        super.init(node: node, topicName: topicName, statusName: statusName, valueKey: valueKey)
        self.stringNode = self.rclObjC.createNode("StringStatusTopic")
    }
    
    public override func start() {
        self.publisher = self.getNode().createPublisher(ROS_std_msgs_msg_String.self, self.getTopicName()) as! ROSPublisher<ROS_std_msgs_msg_String>
    }
    
    public override func publishStatus(status: Status) {
        if rclObjC.ok() {
            if status.getName() == self.getSupportedStatus() {
                var msg = ROS_std_msgs_msg_String()
                
                var value: String = status.getValue()[self.valueKey]!
                
                if value != "" {
                    msg.data = value as NSString
                    
                    self.publisher.publish(msg)
                }
            }
            
            rclObjC.spinOnce(stringNode)
        }
    
        
    }
    
}
