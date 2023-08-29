//
//  EmitterManager.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/29.
//

import Foundation

class EmitterManager: ObservableObject {
    /**
     이것이 싱글톤의 기본 밑바닥 작업이다.
     */
    static let shared = EmitterManager()
    private init() {
        
    }
    
    @Published var isEmitterOn: Bool = false
    @Published var isCongreteModalOn: Bool = false
}
