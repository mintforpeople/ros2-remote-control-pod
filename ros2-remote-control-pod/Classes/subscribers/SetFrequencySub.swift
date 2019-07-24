//
//  SetFrequencySub.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class SetFrequencySub {
    private var subNode: SubNode
    private var topicName: String
    
    private var subscriber: ROSSubscription<ROS_robobo_msgs_aux_msg_SetSensorFrequencyTopic>? = nil
    private var setFrequencySubNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    
    
    public func getNode() -> ROSNode{
        return self.setFrequencySubNode
    }
    
    public init(subNode: SubNode, topicName: String) {
        self.subNode = subNode
        self.topicName = topicName
        self.setFrequencySubNode = self.rclObjC.createNode("SetFrequencySub")
    }
    
    public func start(){
        self.subscriber = self.getNode().createSubscription(withCallback: ROS_robobo_msgs_aux_msg_SetSensorFrequencyTopic.self, topicName, callback) as? ROSSubscription<ROS_robobo_msgs_aux_msg_SetSensorFrequencyTopic>
    }
    
    func callback(mssg: Any?) -> Void {
        var msg = mssg as! ROS_robobo_msgs_aux_msg_SetSensorFrequencyTopic
        
        var freq: String = "FAST"
        switch msg.frequency {
        case 0:
            freq = "LOW"
        case 1:
            freq = "NORMAL"
        case 2:
            freq = "FAST"
        case 3:
            freq = "MAX"
        default:
            freq = "FAST"
        }
        
        var parameters: [String: String] = [String: String]()
        parameters["frequency"] = freq
        //var command: Command = Command("SET-SENSOR-FREQUENCY", 0, parameters)
        //SetFrequencySub.self.subNode.getRemoteControlModule().queueCommand(command)
    }
}
