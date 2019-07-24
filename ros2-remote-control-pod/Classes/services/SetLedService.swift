//
//  SetLedService.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class SetLedService {
    
    private var commandNode: CommandNode
    private var setLedServiceNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    private var service: ROSService<ROS_robobo_msgs_aux_srv_SetLed>? = nil
    
    public init(commandNode: CommandNode) {
        self.commandNode = commandNode
        self.setLedServiceNode = self.rclObjC.createNode("SetLedService")
    }
    
    public func getNode() -> ROSNode{
        return self.setLedServiceNode
    }
    
    public func start() {
        self.service = self.getNode().createService(withCallback: ROS_robobo_msgs_aux_srv_SetLed.self, "setLed", callback) as? ROSService<ROS_robobo_msgs_aux_srv_SetLed>
    }
    
    func callback(msg: Any?, request: Any?, response: Any?) -> Void {
        var req = request as! ROS_robobo_msgs_aux_srv_SetLed_Request
        var resp = response as! ROS_robobo_msgs_aux_srv_SetLed_Response
        
        var parameters: [String: String] = [String: String]()
        parameters["led"] = String(req.id)
        parameters["color"] = String(req.color)
        /*
         var command: Command = Command("SET-LEDCOLOR", 0, parameters)
         commandNode.getRemoteControlModule().queueCommand(command)
         
         var r = resp.error
         r.data = UInt8(0)
         resp.error = r
 */
        
    }
}
