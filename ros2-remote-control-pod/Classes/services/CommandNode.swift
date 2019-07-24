//
//  CommandNode.swift
//  puente
//
//  Created by Lorena Bajo Rebollo on 5/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class CommandNode {
    /*
    private var remoteControlModule: IRemoteControlModule
    
    private var roboboName: String = ""
    
    private var moveWheelsService: MoveWheelsService
    private var movePanTiltService: MovePanTiltService
    private var playSoundService: PlaySoundService
    private var resetWheelsService: ResetWheelsService
    private var setCameraService: SetCameraService
    private var setEmotionService: SetEmotionService
    private var setFrequencyService: SetFrequencyService
    private var setLedService: SetLedService
    private var talkService: TalkService
    
    
    public init(remoteControlModule: IRemoteControlModule, roboboName: String) throws {
    
        if roboboName != "" {
            self.roboboName = roboboName
        }
    
        if remoteControlModule == nil {
            throw InternalErrorException("The parameter remoteControlModule is required")
            print("The parameter remoteControlModule is required")
        }
    
        self.remoteControlModule = remoteControlModule
    }
    
    func getRoboboName() -> String {
        return self.roboboName
    }
    
    func getRemoteControlModule() -> IRemoteControlModule {
        return self.remoteControlModule
    }
    
    public func onStart(executor: Executor) throws {
        
        self.moveWheelsService = MoveWheelsService(self)
        executor.addNode(self.moveWheelsService.getBaseComposableNode())
        self.moveWheelsService.start()
        
        self.movePanTiltService = MovePanTiltService(self)
        executor.addNode(self.movePanTiltService.getBaseComposableNode())
        self.movePanTiltService.start()
        
        self.playSoundService = PlaySoundService(self)
        executor.addNode(self.playSoundService.getBaseComposableNode())
        self.playSoundService.start()
        
        self.resetWheelsService = ResetWheelsService(self)
        executor.addNode(self.resetWheelsService.getBaseComposableNode())
        self.resetWheelsService.start()
        
        self.setCameraService = SetCameraService(self)
        executor.addNode(self.setCameraService.getBaseComposableNode())
        self.setCameraService.start()
        
        self.setEmotionService = SetEmotionService(self)
        executor.addNode(self.setEmotionService.getBaseComposableNode())
        self.setEmotionService.start()
        
        self.setFrequencyService = SetFrequencyService(self)
        executor.addNode(self.setFrequencyService.getBaseComposableNode())
        self.setFrequencyService.start()
        
        self.setLedService = SetLedService(self)
        executor.addNode(self.setLedService.getBaseComposableNode())
        self.setLedService.start()
        
        self.talkService = TalkService(self)
        executor.addNode(self.talkService.getBaseComposableNode())
        self.talkService.start()
        
    }
    */
}

