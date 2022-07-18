//
//  PracticeView.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import SwiftUI

struct PracticeView: View {
    @State var currentView = 1
    
    @State var isStartPractice : Bool = false
    
    var body: some View {
        TabView(selection: $currentView) {
            PracticeTimerView(isStartPractice: $isStartPractice).tag(1)
            PracticeControlView(isStartPractice: $isStartPractice).tag(2)
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
