//
//  WorkoutName.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/22.
//

import Foundation

enum WorkoutName: CaseIterable {
    case deadlift
    case backsquat
    case benchPress
    case cleanAndJerk
    case snatch
    case frontSquat
    case overheadSquat
    case lunge
    case shoulderPress
    
    var description: String {
        switch self {
        case .deadlift:
            return "데드리프트"
        case .backsquat:
            return "백스쿼트"
        case .benchPress:
            return "벤치프레스"
        case .cleanAndJerk:
            return "클린 앤 저크"
        case .snatch:
            return "스내치"
        case .frontSquat:
            return "프론트 스쿼트"
        case .overheadSquat:
            return "오버헤드 스쿼트"
        case .lunge:
            return "런지"
        case .shoulderPress:
            return "숄더프레스"
        }
    }
}
