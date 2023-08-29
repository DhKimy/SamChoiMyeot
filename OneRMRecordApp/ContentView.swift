//
//  ContentView.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/19.
//

import SwiftUI
import AVFoundation

enum Tab {
    case first
    case second
}


struct MyToggleStyle: ToggleStyle {
    private let width = 60.0
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
            
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: width, height: width / 2)
                    .foregroundColor(configuration.isOn ? .green : .gray)
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: (width / 2) - 4, height: width / 2 - 6)
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation {
                            configuration.$isOn.wrappedValue.toggle()
                        }
                    }
            }
        }
    }
}

struct ContentView: View {
    @State private var selectedTab: Tab = .first
    @ObservedObject var crossFitDataModel = CrossFitDataModel.shared
    @State private var audioPlayer: AVAudioPlayer?
    @AppStorage("isPound") var isPound: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack(spacing: 0) {
                ZStack {
                    VStack(spacing: 0) {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 200)
                    }
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 3.5, alignment: .topLeading)
                    Toggle(isOn: $isPound) {
                        Text("파운드로 보기")
                            .font(.system(size: 16, weight: .bold))
                            .padding(0)
                    }
                    .toggleStyle(MyToggleStyle())
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 4, alignment: .bottomTrailing)
                    
                    
                    VStack(spacing: 0) {
                        Text("나의 삼대 중량")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.bottom, 5)
                        
                        Text("\(crossFitDataModel.threeWorkoutTotal()) \(isPound ? "lb" : "kg")")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom, 20)
                        Rectangle()
                            .frame(height: 2)
                    }
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 3.5, alignment: .bottomLeading)
                    
                    Button(action: {
                        playSound(fileName: "lightweight_\(Int.random(in: 1 ... 2))", fileType: "mp3")
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.green)
                            Text("응원\n듣기")
                                .foregroundColor(.white)
                                .fontWeight(.black)
                        }
                        .frame(maxWidth: UIScreen.main.bounds.width / 6, maxHeight: UIScreen.main.bounds.width / 6)
                        .cornerRadius(100)
                    }
                    .padding(.leading, 10)
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 3.5, alignment: .topTrailing)
                }
            }
            .padding(.horizontal, 26)
            .padding(.vertical, 26)
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            
            TabView(selection: $selectedTab) {
                OneRMView(crossFitDataModel: crossFitDataModel, isPound: $isPound)
                    .tabItem {
                        VStack(spacing: 0) {
                            Image(systemName: "dumbbell.fill")
                            Text("1RM 기록")
                        }
                    }
                    .tag(Tab.first)
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                CalculatorView(isPound: $isPound)
                    .tabItem {
                        VStack(spacing: 0) {
                            Image(systemName: "pencil")
                            Text("1RM 계산")
                        }
                    }
                    .tag(Tab.second)
            }
            .accentColor(.green)
            
        }
        .onChange(of: isPound) { newValue in
            crossFitDataModel.changeWeightStandard(isFound: newValue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
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
