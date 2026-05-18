import Foundation

// リストAPI用（/pokemon?limit=151 のレスポンス）
struct PokemonListResponse: Decodable {
    let results: [PokemonListItem]
}

struct PokemonListItem: Identifiable, Decodable {
    let name: String
    let url: String

    // URLの末尾からIDを取り出す（例: ".../pokemon/25/" → 25）
    var id: Int {
        let parts = url.split(separator: "/")
        return Int(parts.last ?? "") ?? 0
    }

    // スプライト画像のURL
    var imageURL: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
    }

    // 表示用の名前（先頭大文字）
    var displayName: String {
        name.capitalized
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
