//
//  TalkService.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class TalkService {
    
    private var commandNode: CommandNode
    private var talkServiceNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    private var service: ROSService<ROS_robobo_msgs_aux_srv_Talk>? = nil
    
    public init(commandNode: CommandNode) {
        self.commandNode = commandNode
        self.talkServiceNode = self.rclObjC.createNode("TalkService")
    }
    
    public func getNode() -> ROSNode{
        return self.talkServiceNode
    }
    
    public func start() {
        self.service = self.getNode().createService(withCallback: ROS_robobo_msgs_aux_srv_Talk.self, "talk", callback) as? ROSService<ROS_robobo_msgs_aux_srv_Talk>
    }
    
    func callback(msg: Any?, request: Any?, response: Any?) -> Void {

        var req = request as! ROS_robobo_msgs_aux_srv_Talk_Request
        var resp = response as! ROS_robobo_msgs_aux_srv_Talk_Response
        
        var panParams: [String: String] = [String: String]()
        panParams["text"] = String(req.text)
        //var command: Command = Command("TALK", 0, parameters)()
        //commandNode.getRemoteControlModule().queueCommand(command)
        /*
         var r = resp.error
         r.data = UInt8(0)
         resp.error = r
        */
    }
}
