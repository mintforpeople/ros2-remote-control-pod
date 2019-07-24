//
//  SetCameraSercice.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class SetCameraService {
    
    private var commandNode: CommandNode
    private var setCameraServiceNode: ROSNode
    private var rclObjC = ROSRCLObjC.self
    private var service: ROSService<ROS_robobo_msgs_aux_srv_SetCamera>? = nil
    
    public init(commandNode: CommandNode) {
        self.commandNode = commandNode
        self.setCameraServiceNode = self.rclObjC.createNode("SetCameraService")
    }
    
    public func getNode() -> ROSNode{
        return self.setCameraServiceNode
    }
    
    public func start() {
        self.service = self.getNode().createService(withCallback: ROS_robobo_msgs_aux_srv_SetCamera.self, "setCamera", callback) as? ROSService<ROS_robobo_msgs_aux_srv_SetCamera>
    }
    
    func callback(msg: Any?, request: Any?, response: Any?) -> Void {
        var req = request as! ROS_robobo_msgs_aux_srv_SetCamera_Request
        var resp = response as! ROS_robobo_msgs_aux_srv_SetCamera_Response
        /*
         var camera: String = "front"
         if msg.getCamera().getData() == 1 {
         camera = "back"
         }
         var parameters: [String: String] = [String: String]()
         parameters["camera"] = camera
         var command: Command = Command("SET-CAMERA", 0, parameters)
         commandNode.getRemoteControlModule().queueCommand(command)
         
         var r = resp.error
         r.data = UInt8(0)
         resp.error = r
         */
    }
}
