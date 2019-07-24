//
//  PlaySoundSub.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class PlaySoundSub {
    private var subNode: SubNode
    private var topicName: String
    
    private var subscriber: ROSSubscription<ROS_robobo_msgs_aux_msg_PlaySoundTopic>? = nil
    private var playSoundSubNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    
    
    public func getNode() -> ROSNode{
        return self.playSoundSubNode
    }
    
    public init(subNode: SubNode, topicName: String) {
        self.subNode = subNode
        self.topicName = topicName
        self.playSoundSubNode = self.rclObjC.createNode("PlaySoundSub")
    }
    
    public func start(){
        self.subscriber = self.getNode().createSubscription(withCallback: ROS_robobo_msgs_aux_msg_PlaySoundTopic.self, topicName, callback) as? ROSSubscription<ROS_robobo_msgs_aux_msg_PlaySoundTopic>
    }
    
    func callback(mssg: Any?) -> Void {
        var msg = mssg as! ROS_robobo_msgs_aux_msg_PlaySoundTopic
        
        var parameters: [String: String] = [String: String]()
        parameters["sound"] = msg.sound as! String
        //var command: Command = Command("PLAY-SOUND",0, parameters)
        //PlaySoundSub.self.subNode.getRemoteControlModule().queueCommand(command)
        
       
    }
}
