import SwiftUI

struct PokemonListView: View {
    @State private var pokemons: [Pokemon] = []

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(pokemons) { pokemon in
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
            .navigationTitle("ポケモン図鑑")
            .navigationBarTitleDisplayMode(.inline)
            .refreshable {
                do {
                    self.pokemons = try await getPokemons()
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
            .task {
                do {
                    self.pokemons = try await getPokemons()
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }

    func getPokemons() async throws -> [Pokemon] {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(PokemonListResponse.self, from: data)
        return response.results.map { $0.toPokemon() }
    }
}

#Preview {
    PokemonListView()
}
