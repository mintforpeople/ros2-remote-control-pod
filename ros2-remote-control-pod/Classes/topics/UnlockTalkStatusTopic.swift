//
//  UnlockTalkStatusTopic.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 4/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class UnlockTalkStatusTopic: AStatusTopic {
    private static var TOPIC: String = "unlock/talk"
    
    public static var STATUS_UNLOCK_TALK: String = "UNLOCK-TALK"
    
    private var publisher = ROSPublisher<ROS_std_msgs_msg_Empty>()
    private var unlockTalkNode = ROSNode()
    private var rclObjC = ROSRCLObjC.self
    
    public func getNode() -> ROSNode{
        return self.unlockTalkNode
    }
    
    public init(node: StatusNode) {
        super.init(node: node, topicName: UnlockTalkStatusTopic.TOPIC, statusName: UnlockTalkStatusTopic.STATUS_UNLOCK_TALK, valueKey: "")
        self.unlockTalkNode = self.rclObjC.createNode("UnlockTalkStatusTopic")
    }
    
    public override func start() {
        self.publisher = self.getNode().createPublisher(ROS_std_msgs_msg_Empty.self, self.getTopicName()) as! ROSPublisher<ROS_std_msgs_msg_Empty>
    }
    
    public override func publishStatus(status: Status) {
        
        if status.getName() == self.getSupportedStatus() {
            let msg = ROS_std_msgs_msg_Empty()
            self.publisher.publish(msg)
           
        }
    }
}


