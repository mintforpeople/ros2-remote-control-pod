//
//  SetCameraSub.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class SetCameraSub {
    private var subNode: SubNode
    private var topicName: String
    
    private var subscriber: ROSSubscription<ROS_robobo_msgs_aux_msg_SetCameraTopic>? = nil
    private var setCameraSubNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    
    
    public func getNode() -> ROSNode{
        return self.setCameraSubNode
    }
    
    public init(subNode: SubNode, topicName: String) {
        self.subNode = subNode
        self.topicName = topicName
        self.setCameraSubNode = self.rclObjC.createNode("SetCameraSub")
    }
    
    public func start(){
        self.subscriber = self.getNode().createSubscription(withCallback: ROS_robobo_msgs_aux_msg_SetCameraTopic.self, topicName, callback) as? ROSSubscription<ROS_robobo_msgs_aux_msg_SetCameraTopic>
    }
    
    func callback(mssg: Any?) -> Void {
        var msg = mssg as! ROS_robobo_msgs_aux_msg_SetCameraTopic

        var camera: String = "front"
        if msg.camera == 1 {
            camera = "back"
        }
        var parameters: [String: String] = [String: String]()
        parameters["camera"] = camera
        //var command: Command = Command("SET-CAMERA", 0, parameters)
        //SetCameraSub.self.subNode.getRemoteControlModule().queueCommand(command)
        
    }
}
