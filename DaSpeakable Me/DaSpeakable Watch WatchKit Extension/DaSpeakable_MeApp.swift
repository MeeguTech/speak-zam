//
//  DaSpeakable_MeApp.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 15/07/22.
//

import SwiftUI

@main
struct DaSpeakable_MeApp: App {
    
    @ObservedObject var model = WatchModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                
//                switch model.isOnPracticeScreen{
//                case true:
//                    StartPracticeView()
//                case false:
//                    ConnectionView()
//                }
                
                ConnectionView(isOnPractice: .constant(model.isOnPracticeScreen))
            }
        }
    }
}
