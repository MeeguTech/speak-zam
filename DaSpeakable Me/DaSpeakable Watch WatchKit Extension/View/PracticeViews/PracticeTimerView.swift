//
//  PracticeTimerView.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import SwiftUI

struct PracticeTimerView: View {
    
    //TODO: cara meng-GET time dari app iOS agar singkron, dan sebaliknya
    
    @Binding var isStartPractice : Bool
    
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
        }
    }
}

struct PracticeTimerView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeTimerView(isStartPractice: .constant(true))
    }
}
