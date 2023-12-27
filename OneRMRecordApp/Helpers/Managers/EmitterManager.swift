//
//  EmitterManager.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 12/27/23.
//

import Foundation

final class EmitterManager: ObservableObject {

    @Published var isEmitterOn = false {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isEmitterOn = false
            }
        }
    }
    static let shared = EmitterManager()
}
