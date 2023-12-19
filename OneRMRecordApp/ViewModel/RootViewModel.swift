//
//  RootViewModel.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 12/19/23.
//

import Foundation

final class RootViewModel: ObservableObject {

    @Published var isEmitterOn: Bool {
        didSet {
            // isEmitterOn 값이 변경될 때의 로직
        }
    }

    init(emitterManager: EmitterManager = EmitterManager.shared) {
        self.isEmitterOn = emitterManager.isEmitterOn
    }
}
