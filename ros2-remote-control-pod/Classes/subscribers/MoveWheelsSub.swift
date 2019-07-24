//
//  MoveWheelsSub.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class MoveWheelsSub {
    private var subNode: SubNode
    private var topicName: String
    
    private var subscriber: ROSSubscription<ROS_robobo_msgs_aux_msg_MoveWheelsTopic>? = nil
    private var moveWheelsSubNode: ROSNode
    private var rclObjC = ROSRCLObjC.self

    
    public func getNode() -> ROSNode{
        return self.moveWheelsSubNode
    }
    
    public init(subNode: SubNode, topicName: String) {
        self.subNode = subNode
        self.topicName = topicName
        self.moveWheelsSubNode = self.rclObjC.createNode("MoveWheelsSub")
    }
    
    public func start(){
        self.subscriber = self.getNode().createSubscription(withCallback: ROS_robobo_msgs_aux_msg_MoveWheelsTopic.self, topicName, callback) as? ROSSubscription<ROS_robobo_msgs_aux_msg_MoveWheelsTopic>
    }
    
    func callback(mssg: Any?) -> Void {
        var msg = mssg as! ROS_robobo_msgs_aux_msg_MoveWheelsTopic

        var parameters: [String: String] = [String: String]()
        parameters["lspeed"] = String(msg.lspeed)
        parameters["rspeed"] = String(msg.rspeed)
        var time: Int = Int(msg.time)
        parameters["time"] = String(Double(time)/1000) //revisar
        var id: Int =  Int(msg.unlockid)
        parameters["blockid"] = String(id)
        //var command: Command = Command("MOVE-BLOCKING", id, parameters)
        //MoveWheelsSub.self.subNode.getRemoteControlModule().queueCommand(command)
        
    }
}
