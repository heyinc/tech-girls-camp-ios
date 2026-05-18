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

    // PokemonListItemに変換する
    func toPokemonListItem() -> PokemonListItem {
        PokemonListItem(
            name: name,
            url: "https://pokeapi.co/api/v2/pokemon/\(pokemonId)/"
        )
    }
}
