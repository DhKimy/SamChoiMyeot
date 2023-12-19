//
//  OneRMViewModel.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 12/19/23.
//

import SwiftUI

final class OneRMViewModel: ObservableObject {

    @ObservedObject var crossFitDataModel: CrossFitDataModel
    @Published var workoutDataArray = Array(repeating: 0, count: 18)
    @Published var isPound = false
    @Published var showAlert = false
    @Published var isIncreaseWeight = false

    init(crossFitDataModel: CrossFitDataModel) {
        self.crossFitDataModel = crossFitDataModel
    }

    func emitterOn() {
        EmitterManager.shared.isEmitterOn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            EmitterManager.shared.isEmitterOn = false
        }
    }
}
