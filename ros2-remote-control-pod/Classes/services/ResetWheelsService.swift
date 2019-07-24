//
//  ResetWheelsService.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class ResetWheelsService {
    
    private var commandNode: CommandNode
    private var resetWheelsServiceNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    private var service: ROSService<ROS_robobo_msgs_aux_srv_ResetWheels>? = nil
    
    public init(commandNode: CommandNode) {
        self.commandNode = commandNode
        self.resetWheelsServiceNode = self.rclObjC.createNode("ResetWheelsService")
    }
    
    public func getNode() -> ROSNode{
        return self.resetWheelsServiceNode
    }
    
    public func start() {
        self.service = self.getNode().createService(withCallback: ROS_robobo_msgs_aux_srv_ResetWheels.self, "resetWheels", callback) as? ROSService<ROS_robobo_msgs_aux_srv_ResetWheels>
    }
    
    func callback(msg: Any?, request: Any?, response: Any?) -> Void {
        var req = request as! ROS_robobo_msgs_aux_srv_ResetWheels_Request
        var resp = response as! ROS_robobo_msgs_aux_srv_ResetWheels_Response
        
        /*
         var command: Command = Command("RESET-WHEELS", 0, nil)
         commandNode.getRemoteControlModule().queueCommand(command)
         
         var r = resp.error
         r.data = UInt8(0)
         resp.error = r
         */
    }
}
