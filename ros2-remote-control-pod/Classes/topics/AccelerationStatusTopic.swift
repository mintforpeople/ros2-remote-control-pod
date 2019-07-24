//
//  AccelerationStatusTopic.swift
//  Talker
//
//  Created by Lorena Bajo Rebollo on 3/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class AccelerationStatusTopic: AStatusTopic {
    private static var TOPIC: String = "accel"
    public static var STATUS: String = "ACCELERATION"
    
    private var publisher = ROSPublisher<ROS_geometry_msgs_msg_Vector3>()
    private var accelNode = ROSNode()
    private var rclObjC = ROSRCLObjC.self

    public func getNode() -> ROSNode{
        return self.accelNode
    }
    
    public init(node: StatusNode) {
        super.init(node: node, topicName: AccelerationStatusTopic.TOPIC, statusName: AccelerationStatusTopic.STATUS, valueKey: "")
        self.accelNode = self.rclObjC.createNode("AccelerationStatusTopic")
    }
    
    public override func start() {
        self.publisher = self.getNode().createPublisher(ROS_geometry_msgs_msg_Vector3.self, self.getTopicName()) as! ROSPublisher<ROS_geometry_msgs_msg_Vector3>
    }
    
    public override func publishStatus(status: Status) {
    
        if status.getName() == self.getSupportedStatus() {
            var msg = ROS_geometry_msgs_msg_Vector3()
            
           // var msg: geometry_msgs__msg__Accel = geometry_msgs__msg__Accel()
            //var linear: geometry_msgs__msg__Vector3 = geometry_msgs__msg__Vector3()
            //linear = msg.linear

            let x: String = status.getValue()["xaccel"]!
            let y: String = status.getValue()["yaccel"]!
            let z: String = status.getValue()["zaccel"]!

            if x != "" && y != "" && z != "" {
                
                msg.x = Double(x)!
                msg.y = Double(y)!
                msg.z = Double(z)!
                
                //msg.linear = linear
                
                self.publisher.publish(msg)

            }
            
        }
        
    }
}
