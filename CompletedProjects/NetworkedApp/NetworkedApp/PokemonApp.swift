import SwiftUI
import SwiftData

@main
struct PokemonApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        // SwiftDataのデータベースを設定する
        .modelContainer(for: FavoritePokemon.self)
    }
}
