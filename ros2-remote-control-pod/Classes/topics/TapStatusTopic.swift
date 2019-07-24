//
//  TapStatusTopic.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 4/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class TapStatusTopic: AStatusTopic {
    private static var TOPIC: String = "tap"
    public static var STATUS: String = "TAP"
    
    private var publisher = ROSPublisher<ROS_robobo_msgs_aux_msg_Tap>()
    private var tapNode = ROSNode()
    private var rclObjC = ROSRCLObjC.self
    
    public func getNode() -> ROSNode{
        return self.tapNode
    }
    
    public init(node: StatusNode) {
        super.init(node: node, topicName: TapStatusTopic.TOPIC, statusName: TapStatusTopic.STATUS, valueKey: "")
        self.tapNode = self.rclObjC.createNode("TapStatusTopic")
    }
    
    public override func start() {
        self.publisher = self.getNode().createPublisher(ROS_robobo_msgs_aux_msg_Tap.self, self.getTopicName()) as! ROSPublisher<ROS_robobo_msgs_aux_msg_Tap>
    }
    
    public override func publishStatus(status: Status) {
        
        if status.getName() == self.getSupportedStatus() {
            var msg = ROS_robobo_msgs_aux_msg_Tap()
            
            var x: String = status.getValue()["coordx"]!
            var y: String = status.getValue()["coordy"]!
            
            if x != "" && y != "" {
                
                msg.x = UInt8(x)! 
                msg.y = UInt8(y)!
                
                self.publisher.publish(msg)
            }

            
        }
        
        
    }
}

