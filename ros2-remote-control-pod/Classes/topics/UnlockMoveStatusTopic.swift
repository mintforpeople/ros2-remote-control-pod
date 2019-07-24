//
//  UnlockMoceStatusTopic.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 4/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class UnlockMoveStatusTopic: AStatusTopic {
    private static var TOPIC: String = "unlock/move"
    
    public static var UNLOCK: String = "UNLOCK"
    public static var UNLOCK_MOVE: String = "UNLOCK-MOVE"
    public static var UNLOCK_PAN: String = "UNLOCK-PAN"
    public static var UNLOCK_TILT: String = "UNLOCK-TILT"
    
    private var publisher = ROSPublisher<ROS_std_msgs_msg_Int16>()
    private var unlockMoveNode = ROSNode()
    private var rclObjC = ROSRCLObjC.self
    
    public func getNode() -> ROSNode{
        return self.unlockMoveNode
    }
    
    public init(node: StatusNode) {
        super.init(node: node, topicName: UnlockMoveStatusTopic.TOPIC, statusName: "", valueKey: "")
        self.unlockMoveNode = self.rclObjC.createNode("UnlockMoveStatusTopic")
    }
    
    public override func start() {
        self.publisher = self.getNode().createPublisher(ROS_std_msgs_msg_Int16.self, self.getTopicName()) as! ROSPublisher<ROS_std_msgs_msg_Int16>
    }
    
    public override func publishStatus(status: Status) {
        
        if status.getName().hasPrefix(UnlockMoveStatusTopic.UNLOCK) {
            var msg = ROS_std_msgs_msg_Int16()

            var value: String = status.getValue()["blockid"]!
            
            if value != "" {
                msg.data = Int16(value)! //revisar
                self.publisher.publish(msg)
            }
        }
    }
}

