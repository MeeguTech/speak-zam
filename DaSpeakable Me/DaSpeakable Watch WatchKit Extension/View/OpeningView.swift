//
//  OpeningScreen.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import SwiftUI

struct OpeningView: View {
    
    //TODO: caritau bagaimana cara mengetahui jikalau app yg di iOS sudah di practice screen
    
    @ObservedObject var model = WatchModel()
    
    //@State var isStartPractice:Bool = false
    //@Binding var isOnPracticeScreen:Bool
    
    
    var body: some View {
        
        NavigationView{
//            if model.isOnPracticeScreen{
//                NavigationLink(destination: StartPracticeView())
//            }else{
//
            VStack(alignment:.leading) {
                Text("It’s time to practice your presentation!")
                    .font(.system(size: 20))
                    .padding(.bottom, 5)
                Text("Tap \(Text("Start Practice").bold()) on your SpeakZam iPhone")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
//            }

            //print(model.isOnPracticeScreen)
            }
        }
        
    }
    
    
}

struct OpeningView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView()
    }
}
