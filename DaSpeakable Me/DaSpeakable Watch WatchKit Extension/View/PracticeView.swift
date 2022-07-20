//
//  PracticeView.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import SwiftUI
import WatchKit

struct PracticeView: View {
    
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    @State var timer: Timer? = nil
    
    var model = WatchModel()
    
    @State var selection: Int? = nil
    @Binding var isStartPractice:Bool
    
    var body: some View {
        
        VStack(alignment: .center){
                Text("\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))")
                    .onAppear(){
                        self.startTimer()
                    }
                    .foregroundColor(Color(UIColor(named: "Winter")!))
                    .font(.system(size: 60))
                NavigationLink(destination: ResultView(), tag: 1, selection: $selection)  {
                    Button(action: {
                        self.stopTimer()
                        self.selection = 1
                        isStartPractice.toggle()
                        sendMessage(isStart: isStartPractice)
                    }){
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .font(.system(size: 30, weight: .semibold))
                    }
                }
                .frame(width: 100, height: 50)
                Text("Finish")
                    .font(.system(size: 15))
                    .foregroundColor(.red)
            
        }
        
        
    }
    func sendMessage(isStart:Bool) {
        print("DI PRACTICE ",isStart)
        
        let dataMessage = ["isStartPractice": isStart]
        model.wcSession.sendMessage(dataMessage, replyHandler: nil)
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.seconds == 59 {
                self.seconds = 0
                if self.minutes == 59 {
                    self.minutes = 0
                    
                } else {
                    self.minutes = self.minutes + 1
                }
            } else {
                self.seconds = self.seconds + 1
            }
        }
    }
    
    func stopTimer(){
        print("timer stopped")
        timer?.invalidate()
        timer = nil
        seconds = 0
        minutes = 0
    }
}


struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView(isStartPractice: .constant(true))
    }
}
