//
//  SetEmotionService.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class SetEmotionService {
    
    private var commandNode: CommandNode
    private var setEmotionServiceNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    private var service: ROSService<ROS_robobo_msgs_srv_SetEmotion>? = nil
    
    public init(commandNode: CommandNode) {
        self.commandNode = commandNode
        self.setEmotionServiceNode = self.rclObjC.createNode("SetEmotionService")
    }
    
    public func getNode() -> ROSNode{
        return self.setEmotionServiceNode
    }
    
    public func start() {
        self.service = self.getNode().createService(withCallback: ROS_robobo_msgs_srv_SetEmotion.self, "setEmotion", callback) as? ROSService<ROS_robobo_msgs_srv_SetEmotion>
    }
    
    func callback(msg: Any?, request: Any?, response: Any?) -> Void {
        var req = request as! ROS_robobo_msgs_aux_srv_SetEmotion_Request
        var resp = response as! ROS_robobo_msgs_aux_srv_SetEmotion_Response
        
         var parameters: [String: String] = [String: String]()
         parameters["emotion"] = String(req.emotion)
         /*
         var command: Command = Command("SET-EMOTION", 0, parameters)
         commandNode.getRemoteControlModule().queueCommand(command)
         
         var r = resp.error
         r.data = UInt8(0)
         resp.error = r
         */
    }
}
