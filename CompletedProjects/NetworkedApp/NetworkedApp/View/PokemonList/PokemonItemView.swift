import SwiftUI
import SwiftData

struct PokemonItemView: View {
    let pokemon: PokemonListItem
    @Environment(\.modelContext) private var modelContext
    @Query private var favorites: [FavoritePokemon]

    private var isFavorite: Bool {
        favorites.contains { $0.pokemonId == pokemon.id }
    }

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: pokemon.imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "photo")
                        .imageScale(.large)
                        .foregroundStyle(.secondary)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 56, height: 56)

            Text("No.\(pokemon.id)")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(width: 40)

            Text(pokemon.displayName)
                .font(.body)
                .fontWeight(.semibold)
                .lineLimit(1)

            Spacer()

            Button(action: {
                let manager = FavoritePokemonManager(modelContext: modelContext)
                manager.toggle(pokemon)
            }) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .foregroundStyle(.yellow)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.08), radius: 2, y: 1)
    }
}

#Preview {
    let pokemon = PokemonListItem(
        name: "pikachu",
        url: "https://pokeapi.co/api/v2/pokemon/25/"
    )

    PokemonItemView(pokemon: pokemon)
        .padding(.horizontal)
        .modelContainer(for: FavoritePokemon.self, inMemory: true)
}
