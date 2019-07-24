//
//  WheelsStatusTopic.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 4/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class WheelsStatusTopic: AStatusTopic {
    
    private static var TOPIC: String = "wheels"
    public static var STATUS: String = "WHEELS"
    
    private var publisher = ROSPublisher<ROS_robobo_msgs_aux_msg_Wheels>()
    private var wheelsNode = ROSNode()
    private var rclObjC = ROSRCLObjC.self
    
    public func getNode() -> ROSNode{
        return self.wheelsNode
    }
    
    public init(node: StatusNode) {
        super.init(node: node, topicName: WheelsStatusTopic.TOPIC, statusName: WheelsStatusTopic.STATUS, valueKey: "")
        self.wheelsNode = self.rclObjC.createNode("WheelsStatusTopic")
    }
    
    public override func start() {
        self.publisher = self.getNode().createPublisher(ROS_robobo_msgs_aux_msg_Wheels.self, self.getTopicName()) as! ROSPublisher<ROS_robobo_msgs_aux_msg_Wheels>
    }
    
    
    public override func publishStatus(status: Status) {
        
        if status.getName() == self.getSupportedStatus() {
            var msg = ROS_robobo_msgs_aux_msg_Wheels()
           // var msg = robobo_msgs__msg__Wheels()
            
            var wheelPosR: String = status.getValue()["wheelPosR"]!
            var wheelPosL: String = status.getValue()["wheelPosR"]!
            var wheelSpeedR: String = status.getValue()["wheelSpeedR"]!
            var wheelSpeedL: String = status.getValue()["wheelSpeedL"]!
            
            if wheelPosR != "" && wheelPosL != "" && wheelSpeedR != "" && wheelSpeedL != "" {
                
                msg.wheelposr = CLongLong(wheelPosR)!
                msg.wheelposl = CLongLong(wheelPosL)!
                msg.wheelspeedr = CLongLong(wheelSpeedR)!
                msg.wheelspeedl = CLongLong(wheelSpeedL)!
                
                self.publisher.publish(msg)
                
            }
        }
    }
    

}

