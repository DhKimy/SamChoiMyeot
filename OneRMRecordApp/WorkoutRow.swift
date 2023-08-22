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
                Text("약")
                TextField("\(crossFitDataModel.workoutDataArray[rowNumber])", text: Binding(
                    get: {
                        "\(crossFitDataModel.workoutDataArray[rowNumber])"
                        
                    },
                    set: { newValue in
                            crossFitDataModel.workoutDataArray[rowNumber] = Int(newValue) ?? 0
                    }
                ))
                .keyboardType(.numberPad) // 숫자 키패드만 뜨도록 설정
                .textContentType(.oneTimeCode) // 숫자만 입력 받도록 설정
                .frame(maxWidth: 70)
                .padding(.leading, 10)
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
