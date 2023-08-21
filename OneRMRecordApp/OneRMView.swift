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
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("데드리프트")
                                .frame(maxWidth: 120, alignment: .leading)
                                .fontWeight(.black)
                            Spacer()
                            TextField("\(crossFitDataModel.deadlift)", text: Binding(
                                get: { "\(crossFitDataModel.deadlift)" },
                                set: { newValue in
                                    crossFitDataModel.deadlift = Int(newValue) ?? 0
                                }
                            ))
                            .keyboardType(.numberPad) // 숫자 키패드만 뜨도록 설정
                            .textContentType(.oneTimeCode) // 숫자만 입력 받도록 설정
                            .padding(.leading, 26)
                            Text("kg")
                                .padding(.trailing, 30)
                        }
                        .frame(height: 45)
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 0.5)
                    }
                    .padding(.horizontal, 26)
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("백스쿼트")
                                .frame(maxWidth: 120, alignment: .leading)
                                .fontWeight(.black)
                            Spacer()
                            TextField("\(crossFitDataModel.backSquat)", text: Binding(
                                get: { "\(crossFitDataModel.backSquat)" },
                                set: { newValue in
                                    crossFitDataModel.backSquat = Int(newValue) ?? 0
                                }
                            ))
                            .keyboardType(.numberPad) // 숫자 키패드만 뜨도록 설정
                            .textContentType(.oneTimeCode) // 숫자만 입력 받도록 설정
                            .padding(.leading, 26)
                            Text("kg")
                                .padding(.trailing, 30)
                        }
                        .frame(height: 45)
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 0.5)
                    }
                    .padding(.horizontal, 26)
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("벤치프레스")
                                .frame(maxWidth: 120, alignment: .leading)
                                .fontWeight(.black)
                            Spacer()
                            TextField("\(crossFitDataModel.benchPress)", text: Binding(
                                get: { "\(crossFitDataModel.benchPress)" },
                                set: { newValue in
                                    crossFitDataModel.benchPress = Int(newValue) ?? 0
                                }
                            ))
                            .keyboardType(.numberPad) // 숫자 키패드만 뜨도록 설정
                            .textContentType(.oneTimeCode) // 숫자만 입력 받도록 설정
                            .padding(.leading, 26)
                            Text("kg")
                                .padding(.trailing, 30)
                        }
                        .frame(height: 45)
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 0.5)
                    }
                    .padding(.horizontal, 26)
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("클린 앤 저크")
                                .frame(maxWidth: 120, alignment: .leading)
                                .fontWeight(.black)
                            Spacer()
                            TextField("\(crossFitDataModel.cleanAndJerk)", text: Binding(
                                get: { "\(crossFitDataModel.cleanAndJerk)" },
                                set: { newValue in
                                    crossFitDataModel.cleanAndJerk = Int(newValue) ?? 0
                                }
                            ))
                            .keyboardType(.numberPad) // 숫자 키패드만 뜨도록 설정
                            .textContentType(.oneTimeCode) // 숫자만 입력 받도록 설정
                            .padding(.leading, 26)
                            Text("kg")
                                .padding(.trailing, 30)
                        }
                        .frame(height: 45)
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 0.5)
                    }
                    .padding(.horizontal, 26)
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("스내치")
                                .frame(maxWidth: 120, alignment: .leading)
                                .fontWeight(.black)
                            Spacer()
                            TextField("\(crossFitDataModel.snatch)", text: Binding(
                                get: { "\(crossFitDataModel.snatch)" },
                                set: { newValue in
                                    crossFitDataModel.snatch = Int(newValue) ?? 0
                                }
                            ))
                            .keyboardType(.numberPad) // 숫자 키패드만 뜨도록 설정
                            .textContentType(.oneTimeCode) // 숫자만 입력 받도록 설정
                            .padding(.leading, 26)
                            Text("kg")
                                .padding(.trailing, 30)
                        }
                        .frame(height: 45)
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 0.5)
                    }
                    .padding(.horizontal, 26)
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("프론트 스쿼트")
                                .frame(maxWidth: 120, alignment: .leading)
                                .fontWeight(.black)
                            Spacer()
                            TextField("\(crossFitDataModel.frontSquat)", text: Binding(
                                get: { "\(crossFitDataModel.frontSquat)" },
                                set: { newValue in
                                    crossFitDataModel.frontSquat = Int(newValue) ?? 0
                                }
                            ))
                            .keyboardType(.numberPad) // 숫자 키패드만 뜨도록 설정
                            .textContentType(.oneTimeCode) // 숫자만 입력 받도록 설정
                            .padding(.leading, 26)
                            Text("kg")
                                .padding(.trailing, 30)
                        }
                        .frame(height: 45)
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 0.5)
                    }
                    .padding(.horizontal, 26)
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("오버헤드 스쿼트")
                                .frame(maxWidth: 120, alignment: .leading)
                                .fontWeight(.black)
                            Spacer()
                            TextField("\(crossFitDataModel.overheadSquat)", text: Binding(
                                get: { "\(crossFitDataModel.overheadSquat)" },
                                set: { newValue in
                                    crossFitDataModel.overheadSquat = Int(newValue) ?? 0
                                }
                            ))
                            .keyboardType(.numberPad) // 숫자 키패드만 뜨도록 설정
                            .textContentType(.oneTimeCode) // 숫자만 입력 받도록 설정
                            .padding(.leading, 26)
                            Text("kg")
                                .padding(.trailing, 30)
                        }
                        .frame(height: 45)
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 0.5)
                    }
                    .padding(.horizontal, 26)
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("런지")
                                .frame(maxWidth: 120, alignment: .leading)
                                .fontWeight(.black)
                            Spacer()
                            TextField("\(crossFitDataModel.lunge)", text: Binding(
                                get: { "\(crossFitDataModel.lunge)" },
                                set: { newValue in
                                    crossFitDataModel.lunge = Int(newValue) ?? 0
                                }
                            ))
                            .keyboardType(.numberPad) // 숫자 키패드만 뜨도록 설정
                            .textContentType(.oneTimeCode) // 숫자만 입력 받도록 설정
                            .padding(.leading, 26)
                            Text("kg")
                                .padding(.trailing, 30)
                        }
                        .frame(height: 45)
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 0.5)
                    }
                    .padding(.horizontal, 26)
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("숄더프레스")
                                .frame(maxWidth: 120, alignment: .leading)
                                .fontWeight(.black)
                            Spacer()
                            TextField("\(crossFitDataModel.shoulderPress)", text: Binding(
                                get: { "\(crossFitDataModel.shoulderPress)" },
                                set: { newValue in
                                    crossFitDataModel.shoulderPress = Int(newValue) ?? 0
                                }
                            ))
                            .keyboardType(.numberPad) // 숫자 키패드만 뜨도록 설정
                            .textContentType(.oneTimeCode) // 숫자만 입력 받도록 설정
                            .padding(.leading, 26)
                            Text("kg")
                                .padding(.trailing, 30)
                        }
                        .frame(height: 45)
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 0.5)
                    }
                    .padding(.horizontal, 26)
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
