//
//  CrossFitDataModel.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/19.
//

import Foundation
import SwiftUI

class CrossFitDataModel: ObservableObject {
    static let shared = CrossFitDataModel()
    private let coreDataManager = CoreDataManager.shared
    private final let entityName = "CrossFit"
    @Published var backSquat = 0
    @Published var benchPress = 0
    @Published var cleanAndJerk = 0
    @Published var deadlift = 0
    @Published var frontSquat = 0
    @Published var lunge = 0
    @Published var overheadSquat = 0
    @Published var shoulderPress = 0
    @Published var snatch = 0
    
    private init() {
        fetchCrossFitData()
    }
    
    func fetchCrossFitData() {
        let fetchResult = coreDataManager.fetch(entityName: entityName)
        
        guard let crossFitData = fetchResult.first as? CrossFit else {
            print("크로스핏 데이터를 불러오는데 실패했습니다.")
            return
        }
        
        backSquat = Int(crossFitData.backSquat)
        benchPress = Int(crossFitData.benchPress)
        cleanAndJerk = Int(crossFitData.cleanAndJerk)
        deadlift = Int(crossFitData.deadlift)
        frontSquat = Int(crossFitData.frontSquat)
        lunge = Int(crossFitData.lunge)
        overheadSquat = Int(crossFitData.overheadSquat)
        shoulderPress = Int(crossFitData.shoulderPress)
        snatch = Int(crossFitData.snatch)
    }
    
    func saveCrossFitData() {
        var crossFitData: CrossFit?
        let fetchResult = coreDataManager.fetch(entityName: entityName)
        if let existingCrossFitData = fetchResult.first as? CrossFit {
            crossFitData = existingCrossFitData
        } else if let newCrossFitData = coreDataManager.create(entityName: entityName, attributes: [:]) as? CrossFit {
            crossFitData = newCrossFitData
        }
        
        guard let crossFit = crossFitData else {
            print("Failed to create or find UserData")
            return
        }
        
        crossFit.backSquat = Int16(backSquat)
        crossFit.benchPress = Int16(benchPress)
        crossFit.cleanAndJerk = Int16(cleanAndJerk)
        crossFit.deadlift = Int16(deadlift)
        crossFit.frontSquat = Int16(frontSquat)
        crossFit.lunge = Int16(lunge)
        crossFit.overheadSquat = Int16(overheadSquat)
        crossFit.shoulderPress = Int16(shoulderPress)
        crossFit.snatch = Int16(snatch)
        
        coreDataManager.update(object: crossFit)
    }
    
    func threeWorkoutTotal() -> Int {
        return backSquat + benchPress + deadlift
    }
    
}
