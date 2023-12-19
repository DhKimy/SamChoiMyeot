//
//  ContentView.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/19.
//

import SwiftUI
import AVFoundation

struct ContentView: View {

    @ObservedObject var viewModel: ContentViewViewModel

    var body: some View {
        ZStack {
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
                        Toggle(isOn: $viewModel.isPound) {
                            Text("파운드로 보기")
                                .font(.system(size: 16, weight: .bold))
                                .padding(0)
                        }
                        .toggleStyle(WeightToggleStyle())
                        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 4, alignment: .bottomTrailing)

                        VStack(spacing: 0) {
                            Text("나의 삼대 중량")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 20, weight: .semibold))
                                .padding(.bottom, 5)

                            Text("\(viewModel.crossFitDataModel.threeWorkoutTotal()) \(viewModel.isPound ? "lb" : "kg")")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 20, weight: .bold))
                                .padding(.bottom, 20)
                            Rectangle()
                                .frame(height: 2)
                        }
                        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 3.5, alignment: .bottomLeading)

                        Button(action: {
                            viewModel.playSound(fileName: "lightweight_\(Int.random(in: 1 ... 4))", fileType: "mp3")
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

                TabView(selection: $viewModel.selectedTab) {
                    OneRMView(viewModel: OneRMViewModel(crossFitDataModel: CrossFitDataModel.shared))
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
                    CalculatorView(isPound: $viewModel.isPound)
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
            .onChange(of: viewModel.isPound) { newValue in
                viewModel.changeWeightStandard(isFound: newValue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewViewModel(crossFitDataModel: CrossFitDataModel.shared))
    }
}
