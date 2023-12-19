//
//  EmitterManager.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/29.
//

import Foundation

final class EmitterManager: ObservableObject {

    @Published var isEmitterOn: Bool = false
    @Published var isCongreteModalOn: Bool = false
    static let shared = EmitterManager()
}
