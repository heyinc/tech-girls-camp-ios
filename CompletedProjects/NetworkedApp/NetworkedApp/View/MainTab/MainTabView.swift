import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            PokemonListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("ポケモン")
                }
            FavoriteListView()
                .tabItem {
                    Image(systemName: "star")
                    Text("お気に入り")
                }
            Text("その他")
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("その他")
                }
        }
    }
}

#Preview {
    MainTabView()
}
