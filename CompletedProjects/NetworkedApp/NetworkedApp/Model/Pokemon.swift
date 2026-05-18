import Foundation

// ポケモンのデータ構造
struct Pokemon: Identifiable {
    let id: Int
    let name: String

    // 表示用の名前（先頭大文字）
    var displayName: String {
        name.capitalized
    }

    // スプライト画像のURL
    var imageURL: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
    }
}

// リストAPI用（/pokemon?limit=151 のレスポンス）
struct PokemonListResponse: Decodable {
    let results: [PokemonListEntry]
}

// APIレスポンスの1件分（name と url のみ）
struct PokemonListEntry: Decodable {
    let name: String
    let url: String

    // PokemonListEntry → Pokemon に変換する
    func toPokemon() -> Pokemon {
        let parts = url.split(separator: "/")
        let id = Int(parts.last ?? "") ?? 0
        return Pokemon(id: id, name: name)
    }
}

// 詳細API用（/pokemon/{id} のレスポンスから必要なものだけ）
struct PokemonDetail: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [TypeSlot]

    struct TypeSlot: Decodable {
        let type: TypeInfo
    }

    struct TypeInfo: Decodable {
        let name: String
    }
}
