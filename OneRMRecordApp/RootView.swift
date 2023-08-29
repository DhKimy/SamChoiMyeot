//
//  RootView.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/29.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var emitterManager = EmitterManager.shared
    
    var body: some View {
        ZStack {
            ContentView()
            if emitterManager.isEmitterOn {
                EmitterView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
