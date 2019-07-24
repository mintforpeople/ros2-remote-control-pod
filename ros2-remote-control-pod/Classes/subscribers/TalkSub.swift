//
//  TalkSub.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class TalkSub {
    private var subNode: SubNode
    private var topicName: String
    
    private var subscriber: ROSSubscription<ROS_robobo_msgs_msg_TalkTopic>? = nil
    private var talkSubNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    
    
    public func getNode() -> ROSNode{
        return self.talkSubNode
    }
    
    public init(subNode: SubNode, topicName: String) {
        self.subNode = subNode
        self.topicName = topicName
        self.talkSubNode = self.rclObjC.createNode("TalkSub")
    }
    
    public func start(){
        self.subscriber = self.getNode().createSubscription(withCallback: ROS_robobo_msgs_msg_TalkTopic.self, topicName, callback) as? ROSSubscription<ROS_robobo_msgs_msg_TalkTopic>
    }
    
    func callback(mssg: Any?) -> Void {
        var msg = mssg as! ROS_robobo_msgs_aux_msg_TalkTopic

        var panParams: [String: String] = [String: String]()
        panParams["text"] = String(msg.text)
        //var command: Command = Command("TALK", 0, parameters)()
        //TalkSub.self.subNode.getRemoteControlModule().queueCommand(command)
    }
}
