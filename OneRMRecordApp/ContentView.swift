//
//  ContentView.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/19.
//

import SwiftUI

enum Tab {
    case first
    case second
}

struct ContentView: View {
    @State private var selectedTab: Tab = .first
    @ObservedObject var crossFitDataModel = CrossFitDataModel.shared
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200)
                    .padding(.bottom, 20)
                Text("나의 삼대 중량")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.bottom, 5)
                Text("\(crossFitDataModel.threeWorkoutTotal()) kg")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.bottom, 20)
                Rectangle()
                    .frame(height: 1)
            }
            .padding(.horizontal, 26)
            .padding(.vertical, 26)
            
            TabView(selection: $selectedTab) {
                OneRMView(crossFitDataModel: crossFitDataModel)
                    .tabItem {
                        VStack(spacing: 0) {
                            Image(systemName: "dumbbell.fill")
                            Text("1RM 기록")
                        }
                    }
                    .tag(Tab.first)
                
                CalculatorView()
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
