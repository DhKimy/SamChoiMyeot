//
//  ContentViewModel.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 12/19/23.
//

import SwiftUI
import AVFoundation

final class ContentViewViewModel: ObservableObject {

    @ObservedObject var crossFitDataModel = CrossFitDataModel.shared
    @Published var selectedTab: Tab = .first
    @Published var isPound: Bool = false
    private var audioPlayer: AVAudioPlayer?

    init(crossFitDataModel: CrossFitDataModel) {
        self.crossFitDataModel = crossFitDataModel
    }

    func playSound(fileName: String, fileType: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileType) else {
            print("Sound file not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }

    func onTapGesture() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    func changeWeightStandard(isFound: Bool) {
        crossFitDataModel.changeWeightStandard(isFound: isFound)
    }
}
