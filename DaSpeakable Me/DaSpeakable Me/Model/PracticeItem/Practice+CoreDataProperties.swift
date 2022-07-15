//
//  Practice+CoreDataProperties.swift
//  DaSpeakable Me
//
//  Created by jevania on 11/07/22.
//
//

import Foundation
import CoreData


extension Practice {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Practice> {
        return NSFetchRequest<Practice>(entityName: "Practice")
    }

    @NSManaged public var practiceTitle: String?
    @NSManaged public var practiceWPM: Double
    @NSManaged public var practiceArticulation: Double
    @NSManaged public var practiceSmoothRate: Double
    @NSManaged public var practiceVideoUrl: String?
    @NSManaged public var practiceFwEh: Int64
    @NSManaged public var practiceFwHa: Int64
    @NSManaged public var practiceFwHm: Int64
    @NSManaged public var practiceCurrentDate: String?
    @NSManaged public var practiceOverallScore: Double

}

extension Practice : Identifiable {

}
