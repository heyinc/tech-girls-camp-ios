//
//  SwiftUIChallenge
//  画像と同じようなViewを実装してみよう！
//
// C. テキストを四角形の左下に配置
//

import SwiftUI

struct cView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle()
                .fill(.green)
                .frame(width: 200, height: 100)
            Text("Bottom Left")
                .foregroundStyle(.white)
                .padding(8)
        }
    }
}

#Preview {
    cView()
}
