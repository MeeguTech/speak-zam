//
//  StartPracticeView.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import SwiftUI

struct StartPracticeView: View {
    
    //TODO: start practice yang ada di iOS dan berpindah ke practiceView
    
    @ObservedObject  var model = WatchModel()
    
    @Binding var isStartPractice:Bool
    
    var body: some View {
        
        VStack(alignment:.center) {
            GeometryReader { geometry in
                Text("Start Practice")
                    .font(.system(size: 35))
                    .multilineTextAlignment(.center)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Circle().fill(Color(UIColor(named: "PastelBlue")!))
                    .scaledToFill())
            }.onTapGesture {
                print("tapped start practice")
                
                sendMessage(isStart: isStartPractice)
            }
        }
    }
    
    func sendMessage(isStart:Bool) {
        print(isStart)
        
        let dataMessage = ["isStartPractice": isStart]
        model.wcSession.sendMessage(dataMessage, replyHandler: nil)
    }
    
}

struct StartPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        StartPracticeView(isStartPractice: .constant(false))
    }
}
