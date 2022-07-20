//
//  ConnectionView.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 21/07/22.
//

import SwiftUI

struct ConnectionView: View {
    
    @ObservedObject var model = WatchModel()
    
    @State var isOnPreactice: Bool = false
    
    var body: some View {
        
        if model.isOnPracticeScreen{
            
            StartPracticeView()
        }else{
            VStack(alignment:.leading) {
                Text("It’s time to practice your presentation!")
                    .font(.system(size: 20))
                    .padding(.bottom, 5)
                Text("Tap \(Text("Start Practice").bold()) on your SpeakZam iPhone")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
        }
        
       
        
    }
}

struct ConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionView()
    }
}
