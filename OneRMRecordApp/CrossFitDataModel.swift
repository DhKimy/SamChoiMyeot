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
    
    @Published var workoutDataArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    init() {
        fetchCrossFitData()
    }
    
    func fetchCrossFitData() {
        let fetchResult = coreDataManager.fetch(entityName: entityName)
        
        guard let crossFitData = fetchResult.first as? CrossFit else {
            print("크로스핏 데이터를 불러오는데 실패했습니다.")
            return
        }

        workoutDataArray[0] = Int(crossFitData.deadlift)
        workoutDataArray[1] = Int(crossFitData.backSquat)
        workoutDataArray[2] = Int(crossFitData.benchPress)
        workoutDataArray[3] = Int(crossFitData.cleanAndJerk)
        workoutDataArray[4] = Int(crossFitData.snatch)
        workoutDataArray[5] = Int(crossFitData.frontSquat)
        workoutDataArray[6] = Int(crossFitData.overheadSquat)
        workoutDataArray[7] = Int(crossFitData.lunge)
        workoutDataArray[8] = Int(crossFitData.shoulderPress)
        
    }
    func saveCrossFitData(isPound: Bool = false) {
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
        
        crossFit.backSquat = Int16(workoutDataArray[1])
        crossFit.benchPress = Int16(workoutDataArray[2])
        crossFit.cleanAndJerk = Int16(workoutDataArray[3])
        crossFit.deadlift = Int16(workoutDataArray[0])
        crossFit.frontSquat = Int16(workoutDataArray[5])
        crossFit.lunge = Int16(workoutDataArray[7])
        crossFit.overheadSquat = Int16(workoutDataArray[6])
        crossFit.shoulderPress = Int16(workoutDataArray[8])
        crossFit.snatch = Int16(workoutDataArray[4])
        
                
        coreDataManager.update(object: crossFit)
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
        
        crossFit.backSquat = Int16(workoutDataArray[1])
        crossFit.benchPress = Int16(workoutDataArray[2])
        crossFit.cleanAndJerk = Int16(workoutDataArray[3])
        crossFit.deadlift = Int16(workoutDataArray[0])
        crossFit.frontSquat = Int16(workoutDataArray[5])
        crossFit.lunge = Int16(workoutDataArray[7])
        crossFit.overheadSquat = Int16(workoutDataArray[6])
        crossFit.shoulderPress = Int16(workoutDataArray[8])
        crossFit.snatch = Int16(workoutDataArray[4])
        
                
        coreDataManager.update(object: crossFit)
    }
    
    func threeWorkoutTotal() -> Int {
        return workoutDataArray[0] + workoutDataArray[1] + workoutDataArray[2]
    }
    
}
