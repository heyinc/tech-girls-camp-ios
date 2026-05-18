//
//  CalculatorView.swift
//  CalculatorApp
//
//  CompletedProjects
//

import SwiftUI

struct CalculatorView: View {
    // 最初に利用する変数を定義しています
    // @State: プロパティが変更されたときにビューを自動的に再描画するためのおまじない
    @State private var firstNumberForSum: String = ""
    @State private var secondNumberForSum: String = ""
    @State private var resultForSum: String = "?"
    @State private var firstNumberForSub: String = ""
    @State private var secondNumberForSub: String = ""
    @State private var resultForSub: String = "?"
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("足し算電卓")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack(spacing: 10) {
                    // 1つ目の入力フィールド
                    // @Stateのついたプロパティには$をつけるというおまじない。
                    TextField("?", text: $firstNumberForSum)
                        .keyboardType(.numberPad)
                        .frame(width: 60)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("+")
                        .font(.title)
                    
                    // 2つ目の入力フィールド
                    TextField("?", text: $secondNumberForSum)
                        .keyboardType(.numberPad)
                        .frame(width: 60)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("=")
                        .font(.title)
                    
                    // 結果の表示
                    Text(resultForSum)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 100)
                        .multilineTextAlignment(.center)
                }
                
                // 計算ボタン
                Button(action: {
                    calculateSum()
                }) {
                    Text("計算する")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            
            Divider()
            
            // TODO: - Challenge2
            // 引き算電卓も作ってみよう
            VStack(spacing: 20) {
                Text("引き算電卓")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack(spacing: 10) {
                    // 1つ目の入力フィールド
                    TextField("?", text: $firstNumberForSub)
                        .keyboardType(.numberPad)
                        .frame(width: 60)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("-")
                        .font(.title)
                    
                    // 2つ目の入力フィールド
                    TextField("?", text: $secondNumberForSub)
                        .keyboardType(.numberPad)
                        .frame(width: 60)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("=")
                        .font(.title)
                    
                    // 結果の表示
                    Text(resultForSub)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 100)
                        .multilineTextAlignment(.center)
                }
                
                // 計算ボタン
                Button(action: {
                    calculateSub()
                }) {
                    Text("計算する")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
    
    // 足し算の処理
    func calculateSum() {
        // TODO: - Challenge1
        //ここに計算ロジックを記述し、計算結果を 表示できるようにしてみよう
        let firstNumberInt = Int(firstNumberForSum)
        let secondNumberInt = Int(secondNumberForSum)
        if let firstNumberInt, let secondNumberInt {
            let resultInt = firstNumberInt + secondNumberInt
            resultForSum = String(resultInt)
        } else {
            resultForSum = "Error"
        }
    }
    
    // 引き算の処理
    func calculateSub() {
        let firstNumberInt = Int(firstNumberForSub)
        let secondNumberInt = Int(secondNumberForSub)
        if let firstNumberInt, let secondNumberInt {
            let resultInt = firstNumberInt - secondNumberInt
            resultForSub = String(resultInt)
        } else {
            resultForSub = "Error"
        }
    }
}

#Preview {
    CalculatorView()
}
