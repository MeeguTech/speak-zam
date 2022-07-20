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

protocol WatchConnectivityServiceRetakePracticeDelegate : AnyObject{
    func retakePractice(isRetake:Bool)
}

class WatchConnectivityService: NSObject, WCSessionDelegate {
    
    var wcSession: WCSession
    
    weak var delegate: WatchConnectivityServiceDelegate?
    weak var delegateRetake: WatchConnectivityServiceRetakePracticeDelegate?
    
    //Emoji & color
//    @Published var isStartPractice: Bool = false
//    @Published var isOnPracticeScreen: Bool = false
    var isStartPractice : Bool = false
    var isRetakePractice: Bool = false
    
    // send data practice
//    var dataPracticeTitle: String = ""
//    var dataPracticeWPM: Double = 0
//    var dataPracticeArticulation: Double = 0
//    var dataPracticeSmoothRate: Double = 0
//    var dataPracticeVideoUrl:String = ""
//    var dataPracticeFwEh: Int = 0
//    var dataPracticeFwHa: Int = 0
//    var dataPracticeFwHm: Int = 0
//    var dataPracticeOverallScore: Double = 0
    
    //send current sccreen
    var dataCurrentScreen: String = ""
    
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
            self.isRetakePractice = message["isRetake"] as? Bool ?? false
            
            // send data practice
//            self.dataPracticeTitle = message["dataPracticeTitle"] as? String ?? "unknown"
//            self.dataPracticeWPM = message["dataPracticeWPM"] as? Double ?? 0
//            self.dataPracticeArticulation = message["dataPracticeArticulation"] as? Double ?? 0
//            self.dataPracticeSmoothRate = message["dataPracticeSmoothRate"] as? Double ?? 0
//            self.dataPracticeVideoUrl = message["dataPracticeVideoUrl"] as? String ?? "unknown"
//            self.dataPracticeFwEh = message["dataPracticeFwEh"] as? Int ?? 0
//            self.dataPracticeFwHa = message["dataPracticeFwHa"] as? Int ?? 0
//            self.dataPracticeFwHm = message["dataPracticeFwHm"] as? Int ?? 0
//            self.dataPracticeOverallScore = message["dataPracticeOverallScore"] as? Double ?? 0
            
            let screen = message["dataCurrentScreen"] as? String ?? "unknown"
            switch screen {
            case "recordingView":
                self.dataCurrentScreen = "recordingView"
            case "mainView":
                self.dataCurrentScreen = "mainView"
            case"resultView":
                self.dataCurrentScreen = "resultView"
            default:
                self.dataCurrentScreen = "unknown"
            }
            
            self.delegate?.startPractice(isStart: self.isStartPractice)
            self.delegateRetake?.retakePractice(isRetake: self.isRetakePractice)
        }

    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
}




