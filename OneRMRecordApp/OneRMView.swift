//
//  OneRMView.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/19.
//

import SwiftUI

struct OneRMView: View {
    @ObservedObject var crossFitDataModel: CrossFitDataModel
    @Binding var isPound: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                ScrollView {
                    VStack {
                        ForEach(Array(WorkoutName.allCases).indices, id:\.self) { index in
                            WorkoutRow(crossFitDataModel: crossFitDataModel, rowNumber: index, isPound: $isPound)
                        }
                    }
                    .padding(.bottom, 150)
                }
                .scrollIndicators(.hidden)
                Button(action: {
                    crossFitDataModel.saveCrossFitData()
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.green)
                        Text("저장")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .fontWeight(.black)
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width / 2.5)
                    .frame(height: 50)
                    .cornerRadius(20)
                }
                .padding(.trailing, 10)
                .position(x:UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2.5)
            }
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
    @State static var isPound = false
    static var previews: some View {
        OneRMView(crossFitDataModel: crossFitDataModel, isPound: $isPound)
    }
}

extension OneRMView {
    
    
}
