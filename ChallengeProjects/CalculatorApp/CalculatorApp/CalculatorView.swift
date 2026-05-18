//
//  CalculatorView.swift
//  CalculatorApp
//
//  ChallengeProjects
//

import SwiftUI

struct CalculatorView: View {
    // 最初に利用する変数を定義しています
    // @State: プロパティが変更されたときにビューを自動的に再描画するためのおまじない
    @State private var firstNumber: String = ""
    @State private var secondNumber: String = ""
    @State private var result: String = "?"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("足し算電卓")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack(spacing: 10) {
                // 1つ目の入力フィールド
                // @Stateのついたプロパティには$をつけるというおまじない。
                TextField("?", text: $firstNumber)
                    .keyboardType(.numberPad)
                    .frame(width: 60)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("+")
                    .font(.title)
                
                // 2つ目の入力フィールド
                TextField("?", text: $secondNumber)
                    .keyboardType(.numberPad)
                    .frame(width: 60)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("=")
                    .font(.title)
                
                // 結果の表示
                Text(result)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 100)
                    .multilineTextAlignment(.center)
            }
            
            // 計算ボタン
            Button(action: {
                // ここでボタンを押した時の挙動を記述
                // 今回は calculateSum() というメソッド(関数)を呼び出しています
                // 具体的な処理は calculateSum() 内に記述します
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
        
    }
    
    // 足し算の処理
    func calculateSum() {
        // TODO: - Challenge1
        // ここに計算ロジックを記述し、計算結果を表示できるようにしてみよう

    }
}

#Preview {
    CalculatorView()
}
