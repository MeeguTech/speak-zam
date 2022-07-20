//
//  WatchModel.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import Foundation
import WatchConnectivity

class WatchModel: NSObject, WCSessionDelegate, ObservableObject{
    
    //@Published var isStartPractice: Bool = false
    
    var wcSession: WCSession
    
    @Published var isOnPracticeScreen: Bool = false
    
    // send data practice
    @Published var dataPracticeTitle: String = ""
    @Published var dataPracticeWPM: Double = 0
    @Published var dataPracticeArticulation: Double = 0
    @Published var dataPracticeSmoothRate: Double = 0
    @Published var dataPracticeVideoUrl:String = ""
    @Published var dataPracticeFwEh: Int = 0
    @Published var dataPracticeFwHa: Int = 0
    @Published var dataPracticeFwHm: Int = 0
    var dataPracticeOverallScore: Double = 0
    
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
            self.isOnPracticeScreen = message["inOnPracticeScreen"] as? Bool ?? false
            
            // send data practice
            self.dataPracticeTitle = message["dataPracticeTitle"] as? String ?? "unknown"
            self.dataPracticeWPM = message["dataPracticeWPM"] as? Double ?? 0
            self.dataPracticeArticulation = message["dataPracticeArticulation"] as? Double ?? 0
            self.dataPracticeSmoothRate = message["dataPracticeSmoothRate"] as? Double ?? 0
            self.dataPracticeVideoUrl = message["dataPracticeVideoUrl"] as? String ?? "unknown"
            self.dataPracticeFwEh = message["dataPracticeFwEh"] as? Int ?? 0
            self.dataPracticeFwHa = message["dataPracticeFwHa"] as? Int ?? 0
            self.dataPracticeFwHm = message["dataPracticeFwHm"] as? Int ?? 0
            self.dataPracticeOverallScore = message["dataPracticeOverallScore"] as? Double ?? 0
        }

    }
    
//    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
//        DispatchQueue.main.async {
//
//            self.isStartPractice = message["isStartPractice"] as? Bool ?? false
//            print("inModal", self.isStartPractice)
//        }
//
////        dataColor = message
//    }
//
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
}
