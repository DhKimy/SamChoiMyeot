//
//  WeightToggleStyle.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 12/19/23.
//

import SwiftUI

struct WeightToggleStyle: ToggleStyle {

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
