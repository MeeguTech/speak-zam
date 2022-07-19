//
//  WatchConnectivityServices.swift
//  DaSpeakable Me
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import Foundation
import WatchConnectivity


protocol WatchConnectivityServiceDelegate : AnyObject{
    func startPractice(isStart:Bool)
}

class WatchConnectivityService: NSObject, WCSessionDelegate {
    
    var wcSession: WCSession
    
    weak var delegate: WatchConnectivityServiceDelegate?
    
    //Emoji & color
//    @Published var isStartPractice: Bool = false
//    @Published var isOnPracticeScreen: Bool = false
    var isStartPractice : Bool = false
    
    //init session and activate watch connectivity
    init(session: WCSession = .default){
        self.wcSession = session
        super.init()
        self.wcSession.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // MARK: Capture Data
        DispatchQueue.main.async {
            
            self.isStartPractice = message["isStartPractice"] as? Bool ?? false
            self.delegate?.startPractice(isStart: self.isStartPractice)
            
        }

    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
}




