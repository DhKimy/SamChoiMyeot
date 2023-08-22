//
//  OneRMView.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/19.
//

import SwiftUI
import AVFoundation

struct OneRMView: View {
    @ObservedObject var crossFitDataModel: CrossFitDataModel
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    HStack(spacing: 0) {
                        Button(action: {
                            crossFitDataModel.saveCrossFitData()
                        }) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.green)
                                Text("저장")
                                    .foregroundColor(.white)
                                    .fontWeight(.black)
                            }
                            .frame(maxWidth: UIScreen.main.bounds.width / 2)
                            .frame(height: 30)
                            .cornerRadius(20)
                            
                        }
                        .padding(.trailing, 10)
                        Button(action: {
                            playSound(fileName: "lightweight", fileType: "mp3")
                        }) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.green)
                                Text("응원 듣기")
                                    .foregroundColor(.white)
                                    .fontWeight(.black)
                            }
                            .frame(maxWidth: UIScreen.main.bounds.width / 2)
                            .frame(height: 30)
                            .cornerRadius(20)
                        }
                        .padding(.leading, 10)
                    }
                    .padding(.horizontal, 26)
                    .padding(.bottom, 30)
                    
                    ForEach(Array(WorkoutName.allCases).indices, id:\.self) { index in
                        WorkoutRow(crossFitDataModel: crossFitDataModel, rowNumber: index)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
    
}

struct OneRMView_Previewer: PreviewProvider {
    @ObservedObject static var crossFitDataModel = CrossFitDataModel.shared
    static var previews: some View {
        OneRMView(crossFitDataModel: crossFitDataModel)
    }
}

extension OneRMView {
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
    
}
