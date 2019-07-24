//
//  MoveWheelsService.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation


public class MoveWheelsService {
    
    private var commandNode: CommandNode
    private var moveWheelsServiceNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    private var service: ROSService<ROS_robobo_msgs_aux_srv_MoveWheels>? = nil
    
    public init(commandNode: CommandNode) {
        self.commandNode = commandNode
        self.moveWheelsServiceNode = self.rclObjC.createNode("MoveWheelsService")
    }
    
    public func getNode() -> ROSNode{
        return self.moveWheelsServiceNode
    }
    
    public func start() {
        self.service = self.getNode().createService(withCallback: ROS_robobo_msgs_aux_srv_MoveWheels.self, "moveWheels", callback) as? ROSService<ROS_robobo_msgs_aux_srv_MoveWheels>
    }
    
    func callback(msg: Any?, request: Any?, response: Any?) -> Void {
        
        var req = request as! ROS_robobo_msgs_aux_srv_MoveWheels_Request
        var resp = response as! ROS_robobo_msgs_aux_srv_MoveWheels_Response
        
        var parameters: [String: String] = [String: String]()
        parameters["lspeed"] = String(req.lspeed)
        parameters["rspeed"] = String(req.rspeed)
        var time: Int = Int(req.time)
        parameters["time"] = String(Double(time)/1000) //revisar
        var id: Int =  Int(req.unlockid)
        parameters["blockid"] = String(id)
        //var command: Command = Command("MOVE-BLOCKING", id, parameters)
        //commandNode.getRemoteControlModule().queueCommand(command)
        
        var r = resp.error
        r = UInt8(0)
        resp.error = r
        
        /*
         var parameters: [String: String] = [String: String]()
         parameters["lspeed"] = String(msg.getLspeed().getData())
         parameters["rspeed"] = String(msg.getRspeed().getData())
         var time: Int = msg.getTime().getData()
         parameters["time"] = String(Double(time)/1000) //revisar
         var id: Int =  msg.getUnlockid().getData()
         parameters["blockid"] = String(id)
         var command: Command = Command("MOVE-BLOCKING", id, parameters)
         commandNode.getRemoteControlModule().queueCommand(command)
         
         var r: Int8 = response.getError()
         r.setData(0 as UInt8)
         response.setError(r)         */
    }
}
