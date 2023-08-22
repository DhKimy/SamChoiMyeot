//
//  WorkoutRow.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/22.
//

import SwiftUI

struct WorkoutRow: View {
    @ObservedObject var crossFitDataModel: CrossFitDataModel
    @State var rowNumber: Int
    @Binding var isPound: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(WorkoutName.allCases[rowNumber].description)
                    .frame(maxWidth: 120, alignment: .leading)
                    .fontWeight(.black)
                Spacer()
                TextField("\(isPound ? Int(Double(crossFitDataModel.workoutDataArray[rowNumber]) * 2.2) : crossFitDataModel.workoutDataArray[rowNumber])", text: Binding(
                    get: {
                        if isPound {
                            return "\(Int(Double(crossFitDataModel.workoutDataArray[rowNumber]) * 2.2))"
                        } else {
                            return "\(crossFitDataModel.workoutDataArray[rowNumber])"
                        }
                    },
                    set: { newValue in
                        if isPound {
                            crossFitDataModel.workoutDataArray[rowNumber] = Int((Double(newValue) ?? 0) * 0.45)
                        } else {
                            crossFitDataModel.workoutDataArray[rowNumber] = Int(newValue) ?? 0
                        }
                    }
                ))
                .keyboardType(.numberPad) // 숫자 키패드만 뜨도록 설정
                .textContentType(.oneTimeCode) // 숫자만 입력 받도록 설정
                .padding(.leading, 26)
                Text(isPound ? "lb" : "kg")
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

struct WorkoutRow_Previews: PreviewProvider {
    @ObservedObject static var crossFitDataModel = CrossFitDataModel()
    @State static var rowNumber = 0
    @State static var isPound = false
    static var previews: some View {
        WorkoutRow(crossFitDataModel: crossFitDataModel, rowNumber: 0, isPound: $isPound)
    }
}
