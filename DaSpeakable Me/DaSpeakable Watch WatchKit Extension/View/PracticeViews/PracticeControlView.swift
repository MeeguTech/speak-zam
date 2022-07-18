//
//  PracticeControlView.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import SwiftUI

struct PracticeControlView: View {
    
    //TODO: cara mentrigger stop practice yang ada di iOS dan berpindah ke result view
    
    @Binding var isStartPractice : Bool
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .fill(Color(uiColor: .green))
                    
                    if isStartPractice{
                        Image(systemName: "play")
                            .font(.system(size: 40, weight: .semibold))
                            .foregroundColor(Color(uiColor: .red))
                    }else{
                        Image(systemName: "pause")
                            .font(.system(size: 40, weight: .semibold))
                            .foregroundColor(Color(uiColor: .green))
                    }
                }
                .onTapGesture {
                    //sendMessage(message: "🙅🏼‍♀️", color: "red")
                }
                
                ZStack {
                    Circle()
                        .fill(Color(uiColor: .green))
                    Image(systemName: "xmark")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundColor(.red)
                }
                .onTapGesture {
                    //sendMessage(message: "✅", color: "cyan")
                }
            }
        }
    }
}

struct PracticeControlView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeControlView(isStartPractice: .constant(true))
    }
}
