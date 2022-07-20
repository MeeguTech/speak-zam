//
//  StartPracticeView.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import SwiftUI

struct StartPracticeView: View {
    
    //TODO: start practice yang ada di iOS dan berpindah ke practiceView
    
    var model = WatchModel()
    
    @State var isStartPractice:Bool = false
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView{
            VStack() {
                NavigationLink(destination: PracticeView(isStartPractice: $isStartPractice), tag: 1, selection: $selection)  {
                    Button(action: {
                        self.selection = 1
                        isStartPractice.toggle()
                        sendMessage(isStart: isStartPractice)
                    }) {
                        
                        Image(systemName: "play.fill")
                            .font(.system(size: 65))
                            .frame(width: 120, height: 120, alignment: .center)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor(named: "PastelBlue")!), Color(UIColor(named: "Navy")!)]), startPoint: .top, endPoint: .bottom))
                            .clipShape(Circle())
                            .font(.system(size: 25))
                    }.buttonStyle(PlainButtonStyle())
                }.buttonStyle(PlainButtonStyle())
                
                
                Text("Tap to Start!")
                    .font(.system(size: 17))
                    .bold()
                    .padding(.top)
            }
        }
    }
    
    func sendMessage(isStart:Bool) {
        print("INI DI START",isStart)
        
        let dataMessage = ["isStartPractice": isStart]
        model.wcSession.sendMessage(dataMessage, replyHandler: nil)
    }
}

struct StartPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        StartPracticeView()
    }
}
