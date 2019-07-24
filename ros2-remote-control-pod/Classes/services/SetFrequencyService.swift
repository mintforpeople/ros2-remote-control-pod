//
//  SetFrequencyService.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class SetFrequencyService {
    /*
    private var commandNode: CommandNode
    private var setFrequencyServiceNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    private var service: ROSService<ROS_robobo_msgs_aux_srv_SetSensorFrequency>? = nil
    
    public init(commandNode: CommandNode) {
        self.commandNode = commandNode
        self.setFrequencyServiceNode = self.rclObjC.createNode("SetFrequencyService")
    }
    
    public func getNode() -> ROSNode{
        return self.setFrequencyServiceNode
    }
    
    public func start() {
        self.service = self.getNode().createService(withCallback: ROS_robobo_msgs_aux_srv_SetSensorFrequency.self, "setSensorFrequency", callback) as? ROSService<ROS_robobo_msgs_aux_srv_SetSensorFrequency>
    }
    
    func callback(msg: Any?, request: Any?, response: Any?) -> Void {
        var req = request as! ROS_robobo_msgs_aux_srv_SetSensorFrequency_Request
        var resp = response as! ROS_robobo_msgs_aux_srv_SetSensorFrequency_Response
        
         var freq: String = "FAST"
         switch req.frequency {
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
         parameters["frequency"] = freq*/
        /*
         var command: Command = Command("SET-SENSOR-FREQUENCY", 0, parameters)
         commandNode.getRemoteControlModule().queueCommand(command)
         
         var r = resp.error
         r.data = UInt8(0)
         resp.error = r
         */
    //}
}
