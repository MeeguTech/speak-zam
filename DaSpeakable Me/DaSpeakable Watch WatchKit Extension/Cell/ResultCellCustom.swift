//
//  ResultCellCustom.swift
//  DaSpeakable Watch WatchKit Extension
//
//  Created by jevania on 20/07/22.
//

import SwiftUI

struct ResultCellCustom: View {
    @ObservedObject var model = WatchModel()
    
    //let practice = model.dataPractice
    
    var body: some View{

        HStack{
            Text("Speaking Pace")
                .foregroundColor(.gray)
                .font(.system(size: 20))
            Spacer()
            Text(" : \(Int(model.dataPracticeWPM))")
                .font(.system(size: 20, weight: .semibold))
        }
        
        HStack{
            Text("Articulation")
                .foregroundColor(.gray)
                .font(.system(size: 20))
            Spacer()
            //Text(" : \(Int(model.dataPracticeArticulation))")
            Text(" : \(String(model.dataPracticeArticulation))")
                .font(.system(size: 20, weight: .semibold))
        }
        
        HStack{
            Text("Smoothness")
                .foregroundColor(.gray)
                .font(.system(size: 20))
            Spacer()
            Text(" : \(Int(model.dataPracticeSmoothRate))")
                .font(.system(size: 20, weight: .semibold))
        }
        
        HStack{
            Text("Filler Word")
                .foregroundColor(.gray)
                .font(.system(size: 20))
            Spacer()
            Text(" : \(Int(model.dataPracticeFwEh + model.dataPracticeFwHa + model.dataPracticeFwHm))")
                .font(.system(size: 20, weight: .semibold))
        }
    }
}

struct ResultCellCustom_Previews: PreviewProvider {
    static var previews: some View {
        ResultCellCustom()
    }
}
