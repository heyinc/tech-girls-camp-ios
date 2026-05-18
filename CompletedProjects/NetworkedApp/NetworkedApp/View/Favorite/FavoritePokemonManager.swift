// SwiftDataを使ったお気に入り管理
// アプリを再起動してもデータが保持される

import Foundation
import SwiftData

struct FavoritePokemonManager {
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func toggle(_ pokemon: Pokemon) {
        if contains(pokemon) {
            remove(pokemon)
        } else {
            add(pokemon)
        }
    }

    func contains(_ pokemon: Pokemon) -> Bool {
        let pokemonId = pokemon.id
        let descriptor = FetchDescriptor<FavoritePokemon>(
            predicate: #Predicate { $0.pokemonId == pokemonId }
        )
        let count = (try? modelContext.fetchCount(descriptor)) ?? 0
        return count > 0
    }

    private func add(_ pokemon: Pokemon) {
        let favorite = FavoritePokemon(pokemonId: pokemon.id, name: pokemon.name)
        modelContext.insert(favorite)
    }

    private func remove(_ pokemon: Pokemon) {
        let pokemonId = pokemon.id
        let descriptor = FetchDescriptor<FavoritePokemon>(
            predicate: #Predicate { $0.pokemonId == pokemonId }
        )
        if let favorites = try? modelContext.fetch(descriptor) {
            for favorite in favorites {
                modelContext.delete(favorite)
            }
        }
    }
}
