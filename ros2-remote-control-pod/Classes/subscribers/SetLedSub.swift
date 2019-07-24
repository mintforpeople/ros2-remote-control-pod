//
//  SetLedSub.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class SetLedSub {
    private var subNode: SubNode
    private var topicName: String
    
    private var subscriber: ROSSubscription<ROS_robobo_msgs_msg_SetLedTopic>? = nil
    private var setLedSubNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    
    
    public func getNode() -> ROSNode{
        return self.setLedSubNode
    }
    
    public init(subNode: SubNode, topicName: String) {
        self.subNode = subNode
        self.topicName = topicName
        self.setLedSubNode = self.rclObjC.createNode("SetLedSub")
    }
    
    public func start(){
        self.subscriber = self.getNode().createSubscription(withCallback: ROS_robobo_msgs_msg_SetLedTopic.self, topicName, callback) as? ROSSubscription<ROS_robobo_msgs_msg_SetLedTopic>
    }
    
    func callback(mssg: Any?) -> Void {
        var msg = mssg as! ROS_robobo_msgs_aux_msg_SetLedTopic

        var parameters: [String: String] = [String: String]()
        parameters["led"] = String(msg.id)
        parameters["color"] = String(msg.color)
        //var command: Command = Command("SET-LEDCOLOR", 0, parameters)
        //SetLedSub.self.subNode.getRemoteControlModule().queueCommand(command)
 
    }
}
