//
//  EmitterViewModel.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 12/19/23.
//

import SwiftUI

final class EmitterViewModel: ObservableObject {

    @Published var emitterCells: [CAEmitterCell] = []

    init() {
        updateEmitterCells()
    }

    func updateEmitterCells() {
        var emitterCells: [CAEmitterCell] = []

        for _ in 1...20 {
            let cell = CAEmitterCell()
            // Create a random shape for the particle
            let shapeType = Int.random(in: 0...3)
            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)
            let alpha = CGFloat.random(in: 0.5...1)

            switch shapeType {
            case 0:
                cell.contents = createCircle().cgImage
            case 1:
                cell.contents = createRectangle1().cgImage
            case 2:
                cell.contents = createRectangle2().cgImage
            case 3:
                cell.contents = createRectangle3().cgImage
            default:
                cell.contents = createCircle().cgImage
            }

            cell.birthRate = 6
            cell.lifetime = 30
            cell.velocity = 200
            cell.velocityRange = 50
            cell.emissionLongitude = .pi * 3.1
            cell.emissionRange = .pi / 4
            cell.scale = 0.1
            cell.scaleRange = 3
            cell.spin = 5
            cell.spinRange = 5
            cell.color = CGColor(red: red, green: green, blue: blue, alpha: alpha)
            emitterCells.append(cell)
        }
        self.emitterCells = emitterCells
    }
}

// MARK: - Private Method
extension EmitterViewModel {

    private func createCircle() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 10, height: 10))
        let image = renderer.image { context in
            let circlePath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 4, height: 4))
            UIColor.white.setFill()
            circlePath.fill()
        }

        return image
    }

    private func createRectangle1() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 10, height: 10))
        let image = renderer.image { context in
            let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: 10))
            UIColor.white.setFill()
            rectanglePath.fill()
        }

        return image
    }

    private func createRectangle2() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 10, height: 10))
        let image = renderer.image { context in
            let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: 5))
            UIColor.white.setFill()
            rectanglePath.fill()
        }

        return image
    }

    private func createRectangle3() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 10, height: 10))
        let image = renderer.image { context in
            let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: 2))
            UIColor.white.setFill()
            rectanglePath.fill()
        }

        return image
    }
}
