import SwiftUI

struct PokemonListView: View {

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                PokemonItemView()
                    .padding(.horizontal)
                PokemonItemView()
                    .padding(.horizontal)
                PokemonItemView()
                    .padding(.horizontal)
                PokemonItemView()
                    .padding(.horizontal)
                PokemonItemView()
                    .padding(.horizontal)
            }
            .padding(.vertical, 8)
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    PokemonListView()
}
