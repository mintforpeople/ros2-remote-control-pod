//
//  OrientationStatusTopic.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 4/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class OrientationStatusTopic: AStatusTopic {
    private static var TOPIC: String = "orientation"
    public static var STATUS: String = "ORIENTATION"
    
    private var publisher = ROSPublisher<ROS_geometry_msgs_msg_Quaternion>()
    private var orientationNode = ROSNode()
    private var rclObjC = ROSRCLObjC.self
    
    public func getNode() -> ROSNode{
        return self.orientationNode
    }
    
    public init(node: StatusNode) {
        super.init(node: node, topicName: OrientationStatusTopic.TOPIC, statusName: OrientationStatusTopic.STATUS, valueKey: "")
        self.orientationNode = self.rclObjC.createNode("OrientationStatusTopic")
    }
    
    public override func start() {
        self.publisher = self.getNode().createPublisher(ROS_geometry_msgs_msg_Quaternion.self, self.getTopicName()) as! ROSPublisher<ROS_geometry_msgs_msg_Quaternion>
    }
    
    public override func publishStatus(status: Status) {
        
        if status.getName() == self.getSupportedStatus() {
    
            var msg = ROS_geometry_msgs_msg_Quaternion()
            
            let x: String = status.getValue()["yaw"]!
            let y: String = status.getValue()["pitch"]!
            let z: String = status.getValue()["roll"]!

            
            if x != "" && y != "" && z != "" {
                let yaw: Double = Double(x)!
                let pitch: Double = Double(y)!
                let roll: Double = Double(z)!

                msg = toQuaternion(q: msg, yaw: yaw, pitch: pitch, roll: roll)
                self.publisher.publish(msg)
            }
        }
    }
    
    private func toQuaternion(q: ROS_geometry_msgs_msg_Quaternion, yaw: Double, pitch: Double, roll: Double) -> ROS_geometry_msgs_msg_Quaternion{
        
        let cy: Double = cos(yaw * 0.5)
        let sy: Double = sin(yaw * 0.5)
        let cr: Double = cos(roll * 0.5)
        let sr: Double = sin(roll * 0.5)
        let cp: Double = cos(pitch * 0.5)
        let sp: Double = sin(pitch * 0.5)
        
        q.w = cy * cr * cp + sy * sr * sp
        q.x = cy * sr * cp - sy * cr * sp
        q.y = cy * cr * sp + sy * sr * cp
        q.z = sy * cr * cp - cy * sr * sp
        
        return q

    }
    
}
