import SwiftUI

struct MainTabView: View {

    var body: some View {
        TabView {
            // ポケモンリスト画面
            PokemonListView()
                .tabItem {
                    Image(systemName: "list.bullet") // タブのアイコン
                    Text("ポケモン") // タブのラベル
                }

            // お気に入り画面（仮置き）
            Text("お気に入り")
                .tabItem {
                    Image(systemName: "star.fill") // タブのアイコン
                    Text("お気に入り") // タブのラベル
                }

            // その他画面（仮置き）
            Text("その他")
                .tabItem {
                    Image(systemName: "ellipsis") // タブのアイコン
                    Text("その他") // タブのラベル
                }
        }
    }
}

#Preview {
    MainTabView()
}
