import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    @State private var detail: PokemonDetail?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // ポケモン画像（大きめ）
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
                .frame(width: 200, height: 200)

                // 名前と番号
                Text("No.\(pokemon.id)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text(pokemon.displayName)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // 詳細情報（API取得後に表示）
                if let detail {
                    // タイプ
                    HStack {
                        ForEach(detail.types, id: \.type.name) { typeSlot in
                            Text(typeSlot.type.name.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.blue.opacity(0.2))
                                .clipShape(Capsule())
                        }
                    }

                    // 高さ・重さ
                    HStack(spacing: 40) {
                        VStack {
                            Text("高さ")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text(String(format: "%.1f m", Double(detail.height) / 10.0))
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        VStack {
                            Text("重さ")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text(String(format: "%.1f kg", Double(detail.weight) / 10.0))
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding()
        }
        .navigationTitle(pokemon.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                detail = try await getPokemonDetail()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func getPokemonDetail() async throws -> PokemonDetail {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemon.id)") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(PokemonDetail.self, from: data)
    }
}

#Preview {
    NavigationStack {
        PokemonDetailView(
            pokemon: Pokemon(id: 25, name: "pikachu")
        )
    }
}
