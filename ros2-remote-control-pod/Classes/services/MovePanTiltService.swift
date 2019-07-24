//
//  MovePanTiltService.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class MovePanTiltService {
    
    private var commandNode: CommandNode
    private var movePanTiltServiceNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    private var service: ROSService<ROS_robobo_msgs_aux_srv_MovePanTilt>? = nil
    
    public init(commandNode: CommandNode) {
        self.commandNode = commandNode
        self.movePanTiltServiceNode = self.rclObjC.createNode("MovePanTiltService")
    }
    
    public func getNode() -> ROSNode{
        return self.movePanTiltServiceNode
    }
    
    public func start() {
        self.service = self.getNode().createService(withCallback: ROS_robobo_msgs_aux_srv_MovePanTilt.self, "movePanTilt", callback) as? ROSService<ROS_robobo_msgs_aux_srv_MovePanTilt>
    }
    
    func callback(msg: Any?, request: Any?, response: Any?) -> Void {
        
        var req = request as! ROS_robobo_msgs_aux_srv_MovePanTilt_Request
        var resp = response as! ROS_robobo_msgs_aux_srv_MovePanTilt_Response
        
        var panParams: [String: String] = [String: String]()
        panParams["pos"] = String(req.panpos)
        panParams["speed"] = String(req.panspeed)
        var panId: Int = Int(req.panunlockid)
        panParams["blockid"] = String(panId)
        //print("MOVE-PT, MovePanMsg: " + String(panParams["pos"]) + " - " + String(panParams["speed"]))
        //var panCommand: Command = Command("MOVEPAN-BLOCKING", panId, panParams)()
        
        var tiltParams: [String: String] = [String: String]()
        tiltParams["pos"] = String(req.tiltpos)
        tiltParams["speed"] = String(req.tiltspeed)
        var tiltId: Int = Int(req.tiltunlockid)
        //Log.i("MOVE-PT", "MovePanMsg: " + (String)tiltParams.get("pos") + " - " + (String)tiltParams.get("speed"))
        //var tiltCommand: Command = Command("MOVETILT-BLOCKING", tiltId, tiltParams)
        /*
        if panId > 0 {
            commandNode.getRemoteControlModule().queueCommand(panCommand)
        }
        if tiltId > 0 {
            commandNode.getRemoteControlModule().queueCommand(tiltCommand)
        }
        */
        var r = resp.error
        r = 0
        resp.error = r //revisar esto
        
        /*
         var panParams: [String: String] = [String: String]()
         panParams["pos"] = String(msg.getPanpos().getData())
         panParams["speed"] = String(msg.getPanspeed().getData())
         var panId: Int = msg.getPanunlockid().getData()
         panParams["blockid"] = String(panId)
         print("MOVE-PT, MovePanMsg: " + String(panParams.get("pos")) + " - " + String(panParams.get("speed")))
         var panCommand: Command = Command("MOVEPAN-BLOCKING", panId, panParams)()
         
         var tiltParams: [String: String] = [String: String]
         tiltParams["pos"] = String(msg.getTiltpos().getData())
         tiltParams["speed"] = String(msg.getTiltspeed().getData())
         var tiltId: Int = msg.getTiltunlockid().getData()
         Log.i("MOVE-PT", "MovePanMsg: " + (String)tiltParams.get("pos") + " - " + (String)tiltParams.get("speed"))
         var tiltCommand: Command = Command("MOVETILT-BLOCKING", tiltId, tiltParams)
         if panId > 0 {
            commandNode.getRemoteControlModule().queueCommand(panCommand)
         }
         if tiltId > 0 {
            commandNode.getRemoteControlModule().queueCommand(tiltCommand)
         }
         
         var r: Int8 = response.getError()
         r.setData(0 as UInt8)
         response.setError(r)
         */
    }
}
