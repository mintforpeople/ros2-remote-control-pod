//
//  SubNode.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class SubNode {
    /*
    private var remoteControlModule: IRemoteControlModule
    
    private var roboboName: String = ""
    
    private var moveWheelsSub: MoveWheelsSub
    private var movePanTiltSub: MovePanTiltSub
    private var playSoundSub: PlaySoundSub
    private var resetWheelsSub: ResetWheelsSub
    private var setCameraSub: SetCameraSub
    private var setEmotionSub: SetEmotionSub
    private var setFrequencySub: SetFrequencySub
    private var setLedSub: SetLedSub
    private var talkSub: TalkSub
    
    public init(remoteControlModule: IRemoteControlModule, roboboName: String) throws {
        if roboboName == "" {
            self.roboboName = roboboName
        }
        
        if remoteControlModule == nil {
            print("The parameter remoteControlModule is required")
        }
    }
    func getRoboboName() -> String {
        return self.roboboName
    }
    
    func getRemoteControlModule() -> IRemoteControlModule {
        return self.remoteControlModule
    }
    
    public func onStart(executor: Executor){
    
        self.moveWheelsSub = new MoveWheelsSub(self,"moveWheels" )
        executor.addNode(self.moveWheelsSub.getBaseComposableNode())
        self.moveWheelsSub.start()
    
        self.movePanTiltSub = new MovePanTiltSub(self, "movePanTilt")
        executor.addNode(self.movePanTiltSub.getBaseComposableNode())
        self.movePanTiltSub.start()
    
        self.playSoundSub = new PlaySoundSub(self, "playSound")
        executor.addNode(self.playSoundSub.getBaseComposableNode())
        self.playSoundSub.start()
    
        self.resetWheelsSub = new ResetWheelsSub(this, "resetWheels")
        executor.addNode(self.resetWheelsSub.getBaseComposableNode())
        self.resetWheelsSub.start()
    
        self.setCameraSub = new SetCameraSub(self, "setCamera")
        executor.addNode(self.setCameraSub.getBaseComposableNode())
        self.setCameraSub.start()
    
        self.setEmotionSub = new SetEmotionSub(this, "setEmotion")
        executor.addNode(self.setEmotionSub.getBaseComposableNode())
        self.setEmotionSub.start()
    
        self.setFrequencySub = new SetFrequencySub(this, "setFrequency")
        executor.addNode(self.setFrequencySub.getBaseComposableNode())
        self.setFrequencySub.start()
    
        self.setLedSub = new SetLedSub(self, "setLed")
        executor.addNode(self.setLedSub.getBaseComposableNode())
        self.setLedSub.start()
    
        self.talkSub = new TalkSub(self, "talk")
        executor.addNode(self.talkSub.getBaseComposableNode())
        self.talkSub.start()
    }
 */
}
