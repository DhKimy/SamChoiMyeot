//
//  RootViewModel.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 12/19/23.
//

import SwiftUI

final class RootViewModel: ObservableObject {

    @Published var isEmitterOn = EmitterManager.shared.isEmitterOn {
        didSet {

        }
    }
}
