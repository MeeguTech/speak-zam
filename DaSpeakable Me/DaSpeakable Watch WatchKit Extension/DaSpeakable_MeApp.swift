//
//  DaSpeakable_MeApp.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 15/07/22.
//

import SwiftUI

@main
struct DaSpeakable_MeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                StartPracticeView()
                //StartPracticeView(isStartPractice:.c )
                
                //OpeningView(isOnPracticeScreen: .constant(true))
            }
        }
    }
}
