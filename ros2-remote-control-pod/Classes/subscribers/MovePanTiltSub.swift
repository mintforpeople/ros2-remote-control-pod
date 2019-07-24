//
//  MovePanTiltSub.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class MovePanTiltSub {
    private var subNode: SubNode
    private var topicName: String
    
    private var subscriber: ROSSubscription<ROS_robobo_msgs_aux_msg_MovePanTiltTopic>? = nil
    private var movePanTiltSubNode: ROSNode
    private var rclObjC = ROSRCLObjC.self

    public func getNode() -> ROSNode{
        return self.movePanTiltSubNode
    }
    
    public init(subNode: SubNode, topicName: String) {
        self.subNode = subNode
        self.topicName = topicName
        self.movePanTiltSubNode = self.rclObjC.createNode("MovePanTiltSub")
    }
    
    public func start(){
        self.subscriber = self.getNode().createSubscription(withCallback: ROS_robobo_msgs_aux_msg_MovePanTiltTopic.self, topicName, callback) as? ROSSubscription<ROS_robobo_msgs_aux_msg_MovePanTiltTopic>
    }
    
    func callback(mssg: Any?) -> Void {
        var msg = mssg as! ROS_robobo_msgs_aux_msg_MovePanTiltTopic
        
        var panParams: [String: String] = [String: String]()
        panParams["pos"] = String(msg.panpos)
        panParams["speed"] = String(msg.panspeed)
        var panId: Int = Int(msg.panunlockid)
        panParams["blockid"] = String(panId)
        //print("MOVE-PT, MovePanMsg: " + String(panParams["pos"]!) + " - " + String(panParams["speed"]!))
      //  var panCommand: Command = Command("MOVEPAN-BLOCKING", panId, panParams)()
        
        var tiltParams: [String: String] = [String: String]()
        tiltParams["pos"] = String(msg.tiltpos)
        tiltParams["speed"] = String(msg.tiltspeed)
        var tiltId: Int = Int(msg.tiltunlockid)
        //Log.i("MOVE-PT", "MovePanMsg: " + String(tiltParams["pos"]) + " - " +String(tiltParams["speed"]))
       // var tiltCommand: Command = Command("MOVETILT-BLOCKING", tiltId, tiltParams)
        /*
        if panId > 0 {
            MovePanTiltSub.self.subNode.getRemoteControlModule().queueCommand(panCommand)
        }
        if tiltId > 0 {
            MovePanTiltSub.self.subNode.getRemoteControlModule().queueCommand(tiltCommand)
        }
        */
    }
}
