//
//  EmitterView.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/29.
//

import SwiftUI

struct EmitterView: UIViewRepresentable {

    @ObservedObject var viewModel: EmitterViewModel

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        // Emitter layer
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = viewModel.emitterCells

        // Size and Position
        emitterLayer.emitterSize = CGSize(width: getRect().width, height: 1)
        emitterLayer.emitterPosition = CGPoint(x: getRect().width / 2, y: 0)
        
        view.layer.addSublayer(emitterLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) { }

    private func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

struct EmitterView_Previewer: PreviewProvider {
    static var previews: some View {
        EmitterView(viewModel: EmitterViewModel())
    }
}
