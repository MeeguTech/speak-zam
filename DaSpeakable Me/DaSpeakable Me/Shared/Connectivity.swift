//
//  Connectivity.swift
//  DaSpeakable Me
//
//  Created by Agil Sulapohan Suaga on 21/07/22.
//

import Foundation
import WatchConnectivity

final class Connectivity: NSObject {
    // 2
    static let shared = Connectivity()
    
    // 3
    private override init() {
        super.init()
        // 4
#if !os(watchOS)
        guard WCSession.isSupported() else {
            return
        }
#endif
        
        // 5
        WCSession.default.delegate = self
        WCSession.default.activate()
    }
}

// MARK: - WCSessionDelegate
extension Connectivity: WCSessionDelegate {
    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState,
        error: Error?
    ) {
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        // If the person has more than one watch, and they switch,
        // reactivate their session on the new device.
        WCSession.default.activate()

    }
}


