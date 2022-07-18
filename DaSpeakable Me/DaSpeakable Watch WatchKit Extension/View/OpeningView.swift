//
//  OpeningScreen.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import SwiftUI

struct OpeningView: View {
    
    //TODO: caritau bagaimana cara mengetahui jikalau app yg di iOS sudah di practice screen
    
    var body: some View {
        VStack(alignment:.leading) {
            Text("It’s time to practice your presentation!")
                .font(.system(size: 20))
                .padding(.bottom, 5)
            Text("Open SpeakZam on your phone")
                .foregroundColor(.gray)
                .font(.system(size: 16))
        }
    }
}

struct OpeningView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView()
    }
}
