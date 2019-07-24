//
//  FlingStatusTopic.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 4/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class FlingStatusTopic: AStatusTopic {
  
    private static var TOPIC: String = "fling";
    public static var STATUS: String = "FLING";
    
    private var publisher = ROSPublisher<ROS_robobo_msgs_aux_msg_Fling>()
    private var flingNode = ROSNode()
    private var rclObjC = ROSRCLObjC.self

    public func getNode() -> ROSNode{
        return self.flingNode
    }
    
    public init(node: StatusNode) {
        super.init(node: node, topicName: FlingStatusTopic.TOPIC, statusName: FlingStatusTopic.STATUS, valueKey: "")
        self.flingNode = self.rclObjC.createNode("FlingStatusTopic")
    }
    
    public override func start() {
        self.publisher = self.getNode().createPublisher(ROS_robobo_msgs_aux_msg_Fling.self, self.getTopicName()) as! ROSPublisher<ROS_robobo_msgs_aux_msg_Fling>
    }
    
    
    public override func publishStatus(status: Status) {
  
        if status.getName() == self.getSupportedStatus() {
            var msg = ROS_robobo_msgs_aux_msg_Fling()

            //var msg = robobo_msgs__msg__Fling()
            
            var angle: String = status.getValue()["angle"]!
            var time: String = status.getValue()["time"]!
            var distance: String = status.getValue()["distance"]!
            
            if (angle != "" && time != "" && distance != "") {
                msg.angle = Int16(angle)!
                msg.time = Int32(time)!
                msg.distance = Int16(distance)! //revisar estas 3 cosas
                
                self.publisher.publish(msg)
            }
        }
    }
}
