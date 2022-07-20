//
//  RecordingView.swift
//  DaSpeakable Me
//
//  Created by Agil Sulapohan Suaga on 18/07/22.
//

import Foundation
import SwiftUI
import UIKit

struct ViewBridge: View {
    var body: some View{
        MainVCView()
    }
    
}

struct MainVCView: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return RecordingView()
    }
}

class RecordingView : UIViewController{
    let startPractice: () =  RecordingViewController().startPractice()
}
