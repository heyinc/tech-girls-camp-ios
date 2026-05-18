import SwiftUI

struct PokemonListView: View {
    @State var pokemons: [Pokemon] = []

    var body: some View {
        NavigationStack { // ← NavigationStackを追加して画面遷移を管理
                    ScrollView {
                        LazyVStack(spacing: 8) {
                            ForEach(pokemons) { pokemon in
                                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                    // ← アイテムをタップすると詳細画面へ遷移
                                    PokemonItemView(pokemon: pokemon)
                                        .padding(.horizontal)
                                }
                                .buttonStyle(.plain) // ← デフォルトの青色リンクスタイルを無効化
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    .background(Color(.systemGroupedBackground))
                    .navigationTitle("ポケモン図鑑") // ← 画面上部にタイトルを追加
                    .navigationBarTitleDisplayMode(.inline)
                }
                .task {
                    do {
                        pokemons = try await getPokemons()
                    } catch {
                        print("Failed to fetch pokemons: \(error)")
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
