//
//  CrossFitDataModel.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/19.
//

import Foundation
import SwiftUI

final class CrossFitDataModel: ObservableObject {

    static let shared = CrossFitDataModel()
    private let coreDataManager = CoreDataManager.shared
    private final let entityName = "CrossFit"
    @Published var workoutDataArray = Array(repeating: 0, count: 18)

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
        workoutDataArray[3] = Int(crossFitData.clean)
        workoutDataArray[4] = Int(crossFitData.hangClean)
        workoutDataArray[5] = Int(crossFitData.powerClean)
        workoutDataArray[6] = Int(crossFitData.hangPowerClean)
        workoutDataArray[7] = Int(crossFitData.pushJerk)
        workoutDataArray[8] = Int(crossFitData.cleanAndJerk)
        workoutDataArray[9] = Int(crossFitData.splitJerk)
        workoutDataArray[10] = Int(crossFitData.snatch)
        workoutDataArray[11] = Int(crossFitData.hangSnatch)
        workoutDataArray[12] = Int(crossFitData.powerSnatch)
        workoutDataArray[13] = Int(crossFitData.frontSquat)
        workoutDataArray[14] = Int(crossFitData.overheadSquat)
        workoutDataArray[15] = Int(crossFitData.lunge)
        workoutDataArray[16] = Int(crossFitData.shoulderPress)
        workoutDataArray[17] = Int(crossFitData.pushPress)
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
        
        crossFit.deadlift = Int16(workoutDataArray[0])
        crossFit.backSquat = Int16(workoutDataArray[1])
        crossFit.benchPress = Int16(workoutDataArray[2])
        crossFit.clean = Int16(workoutDataArray[3])
        crossFit.hangClean = Int16(workoutDataArray[4])
        crossFit.powerClean = Int16(workoutDataArray[5])
        crossFit.hangPowerClean = Int16(workoutDataArray[6])
        crossFit.pushJerk = Int16(workoutDataArray[7])
        crossFit.cleanAndJerk = Int16(workoutDataArray[8])
        crossFit.splitJerk = Int16(workoutDataArray[9])
        crossFit.snatch = Int16(workoutDataArray[10])
        crossFit.hangSnatch = Int16(workoutDataArray[11])
        crossFit.powerSnatch = Int16(workoutDataArray[12])
        crossFit.frontSquat = Int16(workoutDataArray[13])
        crossFit.overheadSquat = Int16(workoutDataArray[14])
        crossFit.lunge = Int16(workoutDataArray[15])
        crossFit.shoulderPress = Int16(workoutDataArray[16])
        crossFit.pushPress = Int16(workoutDataArray[17])

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

        crossFit.deadlift = Int16(workoutDataArray[0])
        crossFit.backSquat = Int16(workoutDataArray[1])
        crossFit.benchPress = Int16(workoutDataArray[2])
        crossFit.clean = Int16(workoutDataArray[3])
        crossFit.hangClean = Int16(workoutDataArray[4])
        crossFit.powerClean = Int16(workoutDataArray[5])
        crossFit.hangPowerClean = Int16(workoutDataArray[6])
        crossFit.pushJerk = Int16(workoutDataArray[7])
        crossFit.cleanAndJerk = Int16(workoutDataArray[8])
        crossFit.splitJerk = Int16(workoutDataArray[9])
        crossFit.snatch = Int16(workoutDataArray[10])
        crossFit.hangSnatch = Int16(workoutDataArray[11])
        crossFit.powerSnatch = Int16(workoutDataArray[12])
        crossFit.frontSquat = Int16(workoutDataArray[13])
        crossFit.overheadSquat = Int16(workoutDataArray[14])
        crossFit.lunge = Int16(workoutDataArray[15])
        crossFit.shoulderPress = Int16(workoutDataArray[16])
        crossFit.pushPress = Int16(workoutDataArray[17])

        coreDataManager.update(object: crossFit)
    }
    
    func checkDifferenceData() -> Bool {
        let fetchResult = coreDataManager.fetch(entityName: entityName)
        var checkArray = Array(repeating: 0, count: 18)
        guard let crossFitData = fetchResult.first as? CrossFit else {
            print("크로스핏 데이터를 불러오는데 실패했습니다.")
            return false
        }

        checkArray[0] = Int(crossFitData.deadlift)
        checkArray[1] = Int(crossFitData.backSquat)
        checkArray[2] = Int(crossFitData.benchPress)
        checkArray[3] = Int(crossFitData.clean)
        checkArray[4] = Int(crossFitData.hangClean)
        checkArray[5] = Int(crossFitData.powerClean)
        checkArray[6] = Int(crossFitData.hangPowerClean)
        checkArray[7] = Int(crossFitData.pushJerk)
        checkArray[8] = Int(crossFitData.cleanAndJerk)
        checkArray[9] = Int(crossFitData.splitJerk)
        checkArray[10] = Int(crossFitData.snatch)
        checkArray[11] = Int(crossFitData.hangSnatch)
        checkArray[12] = Int(crossFitData.powerSnatch)
        checkArray[13] = Int(crossFitData.frontSquat)
        checkArray[14] = Int(crossFitData.overheadSquat)
        checkArray[15] = Int(crossFitData.lunge)
        checkArray[16] = Int(crossFitData.shoulderPress)
        checkArray[17] = Int(crossFitData.pushPress)

        for (index, i) in checkArray.enumerated() {
            if i < workoutDataArray[index] {
                return true
            }
        }
        return false
    }
    
    func threeWorkoutTotal() -> Int {
        return workoutDataArray[0] + workoutDataArray[1] + workoutDataArray[2]
    }

    func changeWeightStandard(isFound: Bool) {
        if isFound {
            for (index, i) in workoutDataArray.enumerated() {
                workoutDataArray[index] = Int(Double(i) * 2.5)
            }
        } else {
            for (index, i) in workoutDataArray.enumerated() {
                workoutDataArray[index] = Int(Double(i) * 0.4)
            }
        }
    }
}
