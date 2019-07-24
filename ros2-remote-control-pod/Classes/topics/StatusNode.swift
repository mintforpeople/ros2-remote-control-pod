//
//  StatusNode.swift
//  Talker
//
//  Created by Lorena Bajo Rebollo on 3/7/19.
//  Copyright © 2019 Lorena Bajo Rebollo. All rights reserved.
//

import Foundation

public class StatusNode {
    
    private static var STATUS_BATBASE: String = "BAT-BASE"
    private static var TOPIC_BATBASE: String = "battery/base"
    private static var KEY_BATTERY: String = "level"
    
    private static var STATUS_PHONEBASE: String = "BAT-PHONE"
    private static var TOPIC_PHONEBASE: String = "battery/phone"
    
    private static var STATUS_PAN: String = "PAN"
    private static var TOPIC_PAN: String = "pan"
    private static var STATUS_TILT: String = "TILT"
    private static var TOPIC_TILT: String = "tilt"
    
    private static var STATUS_ALIGHT: String = "AMBIENTLIGHT"
    private static var TOPIC_ALIGHT: String = "ambientlight"
    
    private static var STATUS_EMOTION: String = "EMOTION"
    private static var TOPIC_EMOTION: String = "emotion"
    
    
    private static var TAG: String = "Robobo Status"
    
    private static var NAME_NODE_ROB_STATUS: String = "robobo_status"
    
    
    private var roboboName: String = ""
    
    /*
    private var baseBatteryStatusTopic: Int8StatusTopic
    private var phoneBatteryStatusTopic: Int8StatusTopic
    private var panStatusTopic: Int16StatusTopic
    private var tiltStatusTopic: Int16StatusTopic
    private var ambientLightStatusTopic: Int32StatusTopic
    private var emotionStatusTopic: StringStatusTopic
    private var accelStatusTopic: AccelerationStatusTopic
    private var orientationStatusTopic: OrientationStatusTopic
    private var unlockMoveStatusTopic: UnlockMoveStatusTopic
    private var unlockTalkStatusTopic: UnlockTalkStatusTopic
    private var wheelsStatusTopic: WheelsStatusTopic
    private var ledStatusTopic: LedStatusTopic
    private var tapStatusTopic: TapStatusTopic
    private var flingStatusTopic: FlingStatusTopic
    private var irsStatusTopic: IRsStatusTopic
    */
    
    private var started: Bool = false
    
    
    
    public init(roboboName: String){
        
        if roboboName != nil {
            self.roboboName = roboboName
        }
    }
    
    
    func getRoboboName() -> String{
        return self.roboboName
    }
    
    /*
    public func onStart(executor: Executor) {
        
        self.baseBatteryStatusTopic = Int8StatusTopic(self, "BaseBatteryStatusTopic", TOPIC_BATBASE, STATUS_BATBASE, KEY_BATTERY)()
        self.baseBatteryStatusTopic.start()
        executor.addNode(self.baseBatteryStatusTopic.getBaseComposableNode())
        
        self.phoneBatteryStatusTopic = Int8StatusTopic(self,"PhoneBatteryStatusTopic", TOPIC_PHONEBASE, STATUS_PHONEBASE, KEY_BATTERY)()
        self.phoneBatteryStatusTopic.start()
        executor.addNode(self.phoneBatteryStatusTopic.getBaseComposableNode())
        
        self.panStatusTopic = Int16StatusTopic(self,"PanStatusTopic", TOPIC_PAN, STATUS_PAN, "panPos")()
        self.panStatusTopic.start();
        executor.addNode(self.panStatusTopic.getBaseComposableNode())
        
        self.tiltStatusTopic = Int16StatusTopic(this,"TiltStatusTopic", TOPIC_TILT, STATUS_TILT, "tiltPos")()
        self.tiltStatusTopic.start();
        executor.addNode(self.tiltStatusTopic.getBaseComposableNode())
        
        self.ambientLightStatusTopic = Int32StatusTopic(this,"AmbientLightStatusTopic", TOPIC_ALIGHT, STATUS_ALIGHT, "level")()
        self.ambientLightStatusTopic.start()
        executor.addNode(self.ambientLightStatusTopic.getBaseComposableNode())
        
        self.emotionStatusTopic = StringStatusTopic(this, TOPIC_EMOTION, STATUS_EMOTION, "emotion")()
        self.emotionStatusTopic.start()
        executor.addNode(self.emotionStatusTopic.getBaseComposableNode())
        
        self.accelStatusTopic = AccelerationStatusTopic(self)()
        self.accelStatusTopic.start()
        executor.addNode(self.accelStatusTopic.getBaseComposableNode())
        
        self.orientationStatusTopic = OrientationStatusTopic(self)()
        self.orientationStatusTopic.start()
        executor.addNode(self.orientationStatusTopic.getBaseComposableNode())
        
        self.unlockMoveStatusTopic = UnlockMoveStatusTopic(self)()
        self.unlockMoveStatusTopic.start()
        executor.addNode(self.unlockMoveStatusTopic.getBaseComposableNode())
        
        self.unlockTalkStatusTopic = UnlockTalkStatusTopic(self)()
        self.unlockTalkStatusTopic.start()
        executor.addNode(self.unlockTalkStatusTopic.getBaseComposableNode())
        
        self.wheelsStatusTopic = WheelsStatusTopic(self)()
        self.wheelsStatusTopic.start()
        executor.addNode(self.wheelsStatusTopic.getBaseComposableNode())
        
        self.ledStatusTopic = LedStatusTopic(self)()
        self.ledStatusTopic.start()
        executor.addNode(self.ledStatusTopic.getBaseComposableNode())
        
        self.tapStatusTopic = TapStatusTopic(self)()
        self.tapStatusTopic.start()
        executor.addNode(self.tapStatusTopic.getBaseComposableNode())
        
        self.flingStatusTopic = FlingStatusTopic(self)()
        self.flingStatusTopic.start()
        executor.addNode(self.flingStatusTopic.getBaseComposableNode())
        
        self.irsStatusTopic = IRsStatusTopic(self)()
        self.irsStatusTopic.start()
        executor.addNode(self.irsStatusTopic.getBaseComposableNode())
        
        self.started = true
        
    }
    
    
    
    public func publishStatusMessage(status: com.mytechia.robobo.framework.remote_control.remotemodule.Status) {
        
        if (started) {
            
            switch (status.getName()) {
                
            case STATUS_BATBASE:
                self.baseBatteryStatusTopic.publishStatus(status)
                break
                
            case STATUS_PHONEBASE:
                self.phoneBatteryStatusTopic.publishStatus(status)
                break
                
            case STATUS_PAN:
                self.panStatusTopic.publishStatus(status)
                break
                
            case STATUS_TILT:
                self.tiltStatusTopic.publishStatus(status)
                break
                
            case STATUS_ALIGHT:
                self.ambientLightStatusTopic.publishStatus(status)
                break
                
            case STATUS_EMOTION:
                self.emotionStatusTopic.publishStatus(status)
                break
                
            case AccelerationStatusTopic.STATUS:
                self.accelStatusTopic.publishStatus(status)
                break
                
            case OrientationStatusTopic.STATUS:
                self.orientationStatusTopic.publishStatus(status)
                break
                
            case UnlockTalkStatusTopic.STATUS_UNLOCK_TALK:
                self.unlockTalkStatusTopic.publishStatus(status)
                break
                
            case WheelsStatusTopic.STATUS:
                self.wheelsStatusTopic.publishStatus(status)
                break
                
            case LedStatusTopic.STATUS:
                self.ledStatusTopic.publishStatus(status)
                break
                
            case TapStatusTopic.STATUS:
                self.tapStatusTopic.publishStatus(status)
                break
                
            case FlingStatusTopic.STATUS:
                self.flingStatusTopic.publishStatus(status)
                break
                
            case IRsStatusTopic.STATUS:
                self.irsStatusTopic.publishStatus(status)
                break
                
            default:
                self.unlockMoveStatusTopic.publishStatus(status)
                break
                
            }
            
        }
        
    }
 */
    
    
}
