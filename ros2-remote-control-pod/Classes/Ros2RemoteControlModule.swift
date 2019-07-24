//
//  example.swift
//  Talker
//
//  Created by Lorena Bajo Rebollo on 3/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class Ros2RemoteControlModule {
    
    private static var MODULE_INFO: String = "ROS2 RC Module"
    
    private static var TAG: String = MODULE_INFO
    
    private static var MODULE_VERSION: String = "1.0.0"
    
    public static var ROBOBO_NAME: String = "robobo.name"
    
    //private var context: Context
    
    //private var statusNode: StatusNode
    
    //private var commandNode: CommandNode
    
    private var roboName: String = ""
    
    //private var remoteControlModule: IRemoteControlModule
    
    //private var wakeLock: PowerManager.WakeLock
    
    //private var wifiLock: WifiManager.WifiLock
    
    //private var rosExecutor: Executor
    
    //private var handler: Handler
    
    //private var timer: Timer
    
    
    func startup(){ // RoboboManager y throws
        
    }
    
    func shutdown(){
        
    }
    /*
     //@Override
     public func getModuleInfo() -> String {
     return Ros2RemoteControlModule.MODULE_INFO
     }
     
     //@Override
     public func getModuleVersion() -> String{
     return Ros2RemoteControlModule.MODULE_VERSION
     }
     
     //@Override
     public func notifyStatus(status: Status) {
     statusNode.publishStatusMessage(status)
     }
     
     //@Override
     public func notifyReponse(response: Response) {
     
     }
     
     //@Override
     public func getExecutor() -> Executor {
     return self.rosExecutor
     }
     
     internal func createExecutor() -> Executor {
     return SingleThreadedExecutor()()
     }
     
     public void run() {
     this.timer = new Timer()
     this.timer.scheduleAtFixedRate(new TimerTask() {
     public void run() {
     Runnable runnable = new Runnable() {
     public void run() {
     Ros2RemoteControlModule.this.getExecutor().spinSome()
     }
     }
     Ros2RemoteControlModule.this.handler.post(runnable)
     }
     }, 0L, 200L)
     }
     
     
     //@Override
     public func getStatusNode() -> StatusNode {
     return self.statusNode
     }
     
     //@Override
     public func getCommandNode() -> CommandNode {
     return self.commandNode
     }
     
     //@Override
     public func getRoboboName() -> String {
     return self.roboName
     }
     
     //@Override
     public func initRoboboRos2Nodes(remoteControlModule: IRemoteControlModule, roboboName: String) throws {
     
     
     self.statusNode = StatusNode(roboboName)()
     self.statusNode.onStart(getExecutor())
     
     self.commandNode = CommandNode(remoteControlModule, roboboName)()
     
     do {
     try self.commandNode.onStart(getExecutor())
     
     } catch (e: NoSuchFieldException) {
     e.printStackTrace()
     } catch (e: IllegalAccessException) {
     e.printStackTrace()
     }
     
     }
     */
}

