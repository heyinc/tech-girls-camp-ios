import SwiftUI
import SwiftData

struct FavoriteListView: View {
    // SwiftDataに保存されたお気に入りを自動的に取得する
    @Query(sort: \FavoritePokemon.pokemonId) private var favorites: [FavoritePokemon]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(favorites) { favorite in
                        let pokemon = favorite.toPokemonListItem()
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonItemView(pokemon: pokemon)
                                .padding(.horizontal)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.vertical, 8)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("お気に入り")
            .navigationBarTitleDisplayMode(.inline)
            .overlay {
                if favorites.isEmpty {
                    Text("お気に入りはありません")
                        .padding()
                }
            }
        }
    }
}

#Preview {
    FavoriteListView()
        .modelContainer(for: FavoritePokemon.self, inMemory: true)
}
