import SwiftUI

struct PokemonItemView: View {
    // このViewを構成している要素を宣言
    let pokemon = Pokemon(id: 25, name: "pikachu")

    // お気に入り情報は状態が変わるため、@Stateのおまじない
    @State private var isFavorite: Bool = false

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
                isFavorite.toggle()
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
    PokemonItemView()
        .padding(.horizontal)
}
