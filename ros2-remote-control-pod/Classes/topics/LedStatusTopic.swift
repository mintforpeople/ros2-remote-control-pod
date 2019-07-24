//
//  LedStatusTopic.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 4/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class LedStatusTopic: AStatusTopic {
    private static var TOPIC: String = "leds"
    public static var STATUS: String = "LED"
    private static var MAX_VALUE: Float = 3000

    
    private var publisher = ROSPublisher<ROS_robobo_msgs_aux_msg_Led>()
    private var ledNode = ROSNode()
    private var rclObjC = ROSRCLObjC.self
    
    public func getNode() -> ROSNode{
        return self.ledNode
    }
    
    public init(node: StatusNode) {
        super.init(node: node, topicName: LedStatusTopic.TOPIC, statusName: LedStatusTopic.STATUS, valueKey: "")
        self.ledNode = self.rclObjC.createNode("LedStatusTopic")
    }
    
    public override func start() {
        self.publisher = self.getNode().createPublisher(ROS_robobo_msgs_aux_msg_Led.self, self.getTopicName()) as! ROSPublisher<ROS_robobo_msgs_aux_msg_Led>
    }
    
    public override func publishStatus(status: Status) {
        
        if status.getName() == self.getSupportedStatus() {
            var msg = ROS_robobo_msgs_aux_msg_Led()
            //var msg = robobo_msgs__msg__Led()
            
            var id: String = status.getValue()["id"]!
            var R: String = status.getValue()["R"]!
            var G: String = status.getValue()["G"]!
            var B: String = status.getValue()["B"]!
            
            if id != "" && R != "" && G != "" && B != "" {

                msg.id = id as NSString
                msg.a = 0
                msg.r = Float(R)! / LedStatusTopic.MAX_VALUE
                msg.g = Float(G)! / LedStatusTopic.MAX_VALUE
                msg.b = Float(B)! / LedStatusTopic.MAX_VALUE
                
                self.publisher.publish(msg)
                
            }
            
        }
        
        
    }
}

