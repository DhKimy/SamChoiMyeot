//
//  SettingView.swift
//  OneRMRecordApp
//
//  Created by 김동현 on 2023/08/19.
//

import SwiftUI

struct CalculatorView: View {

    @ObservedObject private var viewModel: CalculatorViewModel

    init(isPound: Binding<Bool>) {
        _viewModel = ObservedObject(wrappedValue: CalculatorViewModel(isPound: isPound.wrappedValue))
    }

    var body: some View {
        VStack {
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("무게 : ")
                        .frame(maxWidth: 120, alignment: .center)
                        .fontWeight(.black)
                    Spacer()
                    TextField("무게를 입력하세요", text: 
                                $viewModel.weight)
                        .tint(.white)
                        .keyboardType(.numberPad) // 숫자 키패드만 뜨도록 설정
                        .textContentType(.oneTimeCode) // 숫자만 입력 받도록 설정
                        .onChange(of: viewModel.weight) { newValue in
                            if let number = Int(newValue), number > 1000 {
                                viewModel.weight = "1000" // 1000 이상의 값은 1000으로 설정
                            }
                        }
                    Text(viewModel.isPound ? "lb" : "kg")
                        .padding(.trailing, 30)
                    Spacer()
                }
                .frame(height: 45)
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 0.5)
            }
            .padding(.horizontal, 26)
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("횟수 : ")
                        .frame(maxWidth: 120, alignment: .center)
                        .fontWeight(.black)
                    Spacer()
                    TextField("횟수를 입력하세요", text: $viewModel.count)
                        .tint(.white)
                        .keyboardType(.numberPad) // 숫자 키패드만 뜨도록 설정
                        .textContentType(.oneTimeCode) // 숫자만 입력 받도록 설정
                        .onChange(of: viewModel.count) { newValue in
                            if let number = Int(newValue), number > 100 {
                                viewModel.count = "100" // 1000 이상의 값은 1000으로 설정
                            }
                        }
                    Text("회")
                        .padding(.trailing, 30)
                    Spacer()
                }
                .frame(height: 45)
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 0.5)
            }
            .padding(.horizontal, 26)
            .padding(.bottom, 20)
            
            HStack(spacing: 0) {
                Button(action: {
                    viewModel.calculate1RM()
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(viewModel.weight == "" || viewModel.count == "" ? .gray : .green)
                        Text("계산하기")
                            .foregroundColor(viewModel.weight == "" || viewModel.count == "" ? .black : .white)
                            .fontWeight(.black)
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width / 2)
                    .frame(height: 30)
                    .cornerRadius(20)
                    
                }
                .padding(.trailing, 10)
                .disabled(viewModel.weight == "" || viewModel.count == "" ? true : false)

            }
            .padding(.horizontal, 26)
            .padding(.bottom, 20)
            
            VStack(spacing: 10) {
                Text(viewModel.resultWeight != 0 ? "당신의 1RM은" : "")
                    .font(.system(size: 18, weight: .semibold))
                Text(viewModel.resultWeight != 0 ? "\(Int(viewModel.resultWeight)) \(viewModel.isPound ? "lb" : "kg")" : "")
                    .font(.system(size: 20, weight: .black))
                Text(viewModel.resultWeight != 0 ? "입니다." : "")
                    .font(.system(size: 18, weight: .semibold))
            }
                
        }
        .onDisappear {
            viewModel.resultWeight = 0.0
            viewModel.weight = ""
            viewModel.count = ""
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct CalculatorView_Priviewer: PreviewProvider {
    @State static var isPound = true
    
    static var previews: some View {
        CalculatorView(isPound: $isPound)
    }
}
