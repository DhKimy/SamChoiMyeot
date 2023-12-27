//
//  CalculatorViewModel.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 12/19/23.
//

import SwiftUI

final class CalculatorViewModel: ObservableObject {
    @Published var weight = ""
    @Published var count = ""
    @Published var resultWeight = 0.0
    @Published private(set) var isPound: Bool

    init(isPound: Bool) {
        self.isPound = isPound
    }

    func calculate1RM() {
        guard let weight = Int(self.weight), let count = Int(self.count) else {
            return
        }

        self.resultWeight = Double(weight) * (1 + (0.0333 * Double(count)))
    }
}
