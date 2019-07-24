//
//  PlaySoundService.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class PlaySoundService {
    /*
    private var commandNode: CommandNode
    private var playSoundServiceNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    private var service: ROSService<ROS_robobo_msgs_aux_srv_PlaySound>? = nil
    
    public init(commandNode: CommandNode) {
        self.commandNode = commandNode
        self.playSoundServiceNode = self.rclObjC.createNode("PlaySoundService")
    }
    
    public func getNode() -> ROSNode{
        return self.playSoundServiceNode
    }
    
    public func start() {
        self.service = self.getNode().createService(withCallback: ROS_robobo_msgs_aux_srv_PlaySound.self, "playSound", callback) as? ROSService<ROS_robobo_msgs_aux_srv_PlaySound>
    }
    
    func callback(msg: Any?, request: Any?, response: Any?) -> Void {
        var req = request as! ROS_robobo_msgs_aux_srv_PlaySound_Request
        var resp = response as! ROS_robobo_msgs_aux_srv_PlaySound_Response
        
        var parameters: [String: String] = [String: String]()
        parameters["sound"] = String(req.sound)*/
        /* var command: Command = Command("PLAY-SOUND",0, parameters)
         commandNode.getRemoteControlModule().queueCommand(command)
         
         var r = resp.error
         r.data = UInt8(0)
         resp.error = r
 
    }
 */
}
