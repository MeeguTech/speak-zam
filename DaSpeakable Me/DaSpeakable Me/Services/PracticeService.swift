//
//  PracticeService.swift
//  DaSpeakable Me
//
//  Created by jevania on 12/07/22.
//

import CoreData
import UIKit

class PracticeService {
  
    func savePractice(practiceTitle: String,
                      practiceWPM: Double,
                      practiceArticulation: Double,
                      practiceSmoothRate: Double,
                      practiceVideoUrl: String,
                      practiceFwEh: Int64,
                      practiceFwHa: Int64,
                      practiceFwHm: Int64,
                      practiceCurrentDate: String,
                      practiceOverallScore: Double){
        
        let practice = Practice(context: ContextService.context)
        
        practice.practiceTitle = practiceTitle
        practice.practiceWPM = practiceWPM
        practice.practiceArticulation = practiceArticulation
        practice.practiceSmoothRate = practiceSmoothRate
        practice.practiceVideoUrl = practiceVideoUrl
        practice.practiceFwEh = practiceFwEh
        practice.practiceFwHa = practiceFwHa
        practice.practiceFwHm = practiceFwHm
        practice.practiceCurrentDate = practiceCurrentDate
        practice.practiceOverallScore = practiceOverallScore
        
        ContextService.saveChanges()
    }
    
    func deletePractice(practice : Practice){
        ContextService.deletePractice(practice: practice)
    }

    func getAllPractice() -> [Practice] {
        let request : NSFetchRequest<Practice> = Practice.fetchRequest()
        
        return ContextService.fetchPractice(request: request)
    }
}

