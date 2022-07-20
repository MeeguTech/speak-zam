//
//  ResultView.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import SwiftUI

struct ResultView: View {
    
    //TODO: Cara mengambil data dari iOS untuk ditampilkan
    
    @ObservedObject var model = WatchModel()
    
    @State var selection: Int? = nil
    @State var isRetakePractice: Bool = false
    
    var body: some View {
        VStack {
            List {
                Text(String(model.dataPracticeOverallScore))
                    .font(.system(size: 20, weight: .semibold))
                    .background(Image("watchBadge").resizable()
                        .scaledToFit()
                        .frame(width: 100,height:100))
                
                ResultCellCustom()
            }
            
            NavigationLink(destination: StartPracticeView(), tag: 1, selection: $selection) {
                Button(action: {
                    print("is tap")
                    isRetakePractice.toggle()
                    sendMessage(isRetake: isRetakePractice)
                }) {
                    Text("Done")
            }
            }
            
        }
    }
    
    func sendMessage(isRetake: Bool) {
        print("isretake: ", isRetake)
        
        let dataMessage = ["isRetake": isRetake]
        model.wcSession.sendMessage(dataMessage, replyHandler: nil)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
