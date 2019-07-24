//
//  ResetWheelsSub.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class ResetWheelsSub {
    private var subNode: SubNode
    private var topicName: String
    
    private var subscriber: ROSSubscription<ROS_robobo_msgs_msg_ResetWheelsTopic>? = nil
    private var resetWheelsSubNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    
    
    public func getNode() -> ROSNode{
        return self.resetWheelsSubNode
    }
    
    public init(subNode: SubNode, topicName: String) {
        self.subNode = subNode
        self.topicName = topicName
        self.resetWheelsSubNode = self.rclObjC.createNode("ResetWheelsSub")
    }
    
    public func start(){
        self.subscriber = self.getNode().createSubscription(withCallback: ROS_robobo_msgs_msg_ResetWheelsTopic.self, topicName, callback) as? ROSSubscription<ROS_robobo_msgs_msg_ResetWheelsTopic>
    }
    
    func callback(msg: Any?) -> Void {
        //var command: Command = Command("RESET-WHEELS", 0, nil)
        //ResetWheelsSub.self.subNode.getRemoteControlModule().queueCommand(command)
    }
}
