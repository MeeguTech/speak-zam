//
//  WatchModel.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import Foundation
import WatchConnectivity

class WatchModel: NSObject, WCSessionDelegate, ObservableObject{
    
    @Published var isStartPractice: Bool = false
    
    var wcSession: WCSession
    
    //init session and activate watch connectivity
    init(session: WCSession = .default){
        self.wcSession = session
        super.init()
        self.wcSession.delegate = self
        session.activate()
    }

    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            
            self.isStartPractice = message["isStartPractice"] as? Bool ?? false
            
        }

//        dataColor = message
    }
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
}
