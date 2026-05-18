import SwiftData

// SwiftDataで保存するためのモデル
// @Modelをつけると、SwiftDataが自動的にデータベースに保存してくれる
@Model
final class FavoritePokemon {
    var pokemonId: Int
    var name: String

    init(pokemonId: Int, name: String) {
        self.pokemonId = pokemonId
        self.name = name
    }

    // Pokemonに変換する
    func toPokemon() -> Pokemon {
        Pokemon(id: pokemonId, name: name)
    }
}
