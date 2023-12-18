//
//  WorkoutName.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/22.
//

import Foundation

enum WorkoutName: CaseIterable {
    // MARK: - 3대 운동
    case deadlift
    case backsquat
    case benchPress
    // MARK: - 크로스핏 용
    // 클린 & 저크
    case clean
    case hangClean
    case powerClean
    case hangPowerClean
    case pushJerk
    case cleanAndJerk
    case splitJerk
    // 스내치
    case snatch
    case hangSnatch
    case powerSnatch
    // 기초 운동
    case frontSquat
    case overheadSquat
    case lunge
    case shoulderPress
    case pushPress

    var description: String {
        switch self {
        case .deadlift: "데드리프트"
        case .backsquat: "백스쿼트"
        case .benchPress: "벤치프레스"
        case .clean: "클린"
        case .hangClean: "행클린"
        case .powerClean: "파워클린"
        case .hangPowerClean: "행파워클린"
        case .pushJerk: "푸시저크"
        case .cleanAndJerk: "클린앤저크"
        case .splitJerk: "스플릿저크"
        case .snatch: "스내치"
        case .hangSnatch: "행스내치"
        case .powerSnatch: "파워스내치"
        case .frontSquat: "프론트스쿼트"
        case .overheadSquat: "오버헤드스쿼트"
        case .lunge: "런지"
        case .shoulderPress: "숄더프레스"
        case .pushPress: "푸시프레스"
        }
    }
}
