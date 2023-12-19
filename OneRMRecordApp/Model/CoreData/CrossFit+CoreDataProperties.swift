//
//  CrossFit+CoreDataProperties.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 12/19/23.
//
//

import Foundation
import CoreData


extension CrossFit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CrossFit> {
        return NSFetchRequest<CrossFit>(entityName: "CrossFit")
    }

    @NSManaged public var backSquat: Int16
    @NSManaged public var benchPress: Int16
    @NSManaged public var cleanAndJerk: Int16
    @NSManaged public var deadlift: Int16
    @NSManaged public var frontSquat: Int16
    @NSManaged public var lunge: Int16
    @NSManaged public var overheadSquat: Int16
    @NSManaged public var shoulderPress: Int16
    @NSManaged public var snatch: Int16
    @NSManaged public var clean: Int16
    @NSManaged public var hangClean: Int16
    @NSManaged public var powerClean: Int16
    @NSManaged public var hangPowerClean: Int16
    @NSManaged public var pushJerk: Int16
    @NSManaged public var splitJerk: Int16
    @NSManaged public var hangSnatch: Int16
    @NSManaged public var powerSnatch: Int16
    @NSManaged public var pushPress: Int16

}

extension CrossFit : Identifiable {

}
