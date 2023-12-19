//
//  RootView.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/29.
//

import SwiftUI

struct RootView: View {

    @ObservedObject var viewModel: RootViewModel

    var body: some View {
        ZStack {
            ContentView(
                viewModel: ContentViewViewModel(
                    crossFitDataModel: CrossFitDataModel()
                )
            )

            if viewModel.isEmitterOn {
                EmitterView(viewModel: EmitterViewModel())
            }
        }
        .onAppear {
            // RootView가 나타날 때의 초기화 로직(데이터 로딩, 푸시 알림 초기화 등)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(viewModel: RootViewModel())
    }
}
