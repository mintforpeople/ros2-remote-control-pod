//
//  SetEmotionSub.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class SetEmotionSub {
    private var subNode: SubNode
    private var topicName: String
    
    private var subscriber: ROSSubscription<ROS_robobo_msgs_aux_msg_SetEmotionTopic>? = nil
    private var setEmotionSubNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    
    
    public func getNode() -> ROSNode{
        return self.setEmotionSubNode
    }
    
    public init(subNode: SubNode, topicName: String) {
        self.subNode = subNode
        self.topicName = topicName
        self.setEmotionSubNode = self.rclObjC.createNode("SetEmotionSub")
    }
    
    public func start(){
        self.subscriber = self.getNode().createSubscription(withCallback: ROS_robobo_msgs_aux_msg_SetEmotionTopic.self, topicName, callback) as? ROSSubscription<ROS_robobo_msgs_aux_msg_SetEmotionTopic>
    }
    
    func callback(mssg: Any?) -> Void {
        var msg = mssg as! ROS_robobo_msgs_aux_msg_SetEmotionTopic
        
        var parameters: [String: String] = [String: String]()
        parameters["emotion"] = String(msg.emotion)
        //var command: Command = Command("SET-EMOTION", 0, parameters)
        //SetEmotionSub.self.subNode.getRemoteControlModule().queueCommand(command)
    
 
    }
}
