//
//  PracticeView.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import SwiftUI

struct PracticeView: View {
    
    var model = WatchModel()
    
    @State var selection: Int? = nil
    @Binding var isStartPractice:Bool
    
    var body: some View {
        VStack(alignment: .center){
            if isStartPractice{
                Text("time is running")
                    .foregroundColor(Color(UIColor(named: "Winter")!))
                    .font(.system(size: 20))
            }else{
                Text("00:15")
                    .foregroundColor(Color(UIColor(named: "Winter")!))
                    .font(.system(size: 60))
            }
            
            NavigationLink(destination: ResultView(), tag: 1, selection: $selection)  {
                Button(action: {
                    self.selection = 1
                    isStartPractice.toggle()
                    sendMessage(isStart: isStartPractice)
                }){
                    Image(systemName: "xmark")
                        .foregroundColor(.red)
                        .font(.system(size: 30, weight: .semibold))
                }
                
            }
            //.background(.red)
            .buttonStyle(PlainButtonStyle())
            .frame(width: 100, height: 50)
            Text("Finish")
                .font(.system(size: 15))
                .foregroundColor(.red)
        }
            
        }
    func sendMessage(isStart:Bool) {
        print(isStart)
        
        let dataMessage = ["isStartPractice": isStart]
        model.wcSession.sendMessage(dataMessage, replyHandler: nil)
    }
    }

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView(isStartPractice: .constant(false))
    }
}
