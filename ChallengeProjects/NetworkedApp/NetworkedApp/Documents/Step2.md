# Step 2 - ForEach を使ってリストを整理する

## 目的
Step 1 では、5つの `PokemonItemView` を **1つずつ手書き** で並べました。  
しかし、実際のアプリでは **数十個、数百個のデータ** を表示することがあります。  
手作業で1つずつ書くのは大変なので、**ForEach を使ってリストを自動生成** する方法を学びます。  

---

## 📌 やること
- `pokemons` 配列を作成し、すべてのデータを **1つの変数で管理**
- `ForEach` を使い、**リストをシンプルに記述**
- `LazyVStack` 内で `ForEach` を利用し、**コードの重複をなくす**
- **データの追加・変更を簡単にする**

---

## 🤔 なぜ ForEach を使うのか？
現在の `PokemonListView` では、次のように **同じようなコードを繰り返し書いています**。

```swift
PokemonItemView(pokemon: pokemon1)
    .padding(.horizontal)

PokemonItemView(pokemon: pokemon2)
    .padding(.horizontal)

PokemonItemView(pokemon: pokemon3)
    .padding(.horizontal)

PokemonItemView(pokemon: pokemon4)
    .padding(.horizontal)

PokemonItemView(pokemon: pokemon5)
    .padding(.horizontal)
```

この方法には **2つの問題** があります。

1. **コードの重複が多い**  
   - ほぼ同じコードを何度も書いているため、追加・修正が大変です。

2. **データの変更が面倒**  
   - 新しいポケモンを追加するたびに、1行ずつ手作業でコードを追加しなければなりません。

---

## ✅ ForEach を使うとどうなる？
SwiftUI の `ForEach` を使うと、次のように **1行のコードでリストを自動生成** できます。

```swift
ForEach(pokemons) { pokemon in
    PokemonItemView(pokemon: pokemon)
        .padding(.horizontal)
}
```

このコードは、`pokemons` 配列の **すべてのデータを自動で処理** し、  
**1つずつ `PokemonItemView` に渡して表示** してくれます。

これにより、**新しいポケモンを追加するときは、配列にデータを増やすだけ！**  
コードを手作業で増やす必要がなくなります。

---

## 🛠 実装手順

### 1. `pokemons` 配列を作成する
Step 1 では、`pokemon1` 〜 `pokemon5` の **5つの変数** を用意しました。  
しかし、リストにするなら配列として管理したほうがわかりやすいです。

次のように、`pokemons` という配列を作り、データをまとめます。

```swift
let pokemons: [Pokemon] = [
    Pokemon(id: 25, name: "pikachu"),
    Pokemon(id: 1, name: "bulbasaur"),
    Pokemon(id: 4, name: "charmander"),
    Pokemon(id: 7, name: "squirtle"),
    Pokemon(id: 133, name: "eevee"),
]
```

---

### 2. `ForEach` でリストを生成
Step 1 では、1つずつ手書きで `PokemonItemView` を追加していました。  
これを `ForEach` を使って自動化します。

```swift
LazyVStack(spacing: 8) {
    ForEach(pokemons) { pokemon in
        PokemonItemView(pokemon: pokemon)
            .padding(.horizontal)
    }
}
```

---

### 3. `PokemonListView` に反映
`pokemons` 配列と `ForEach` を組み合わせて、リスト全体を構築します。

```swift
import SwiftUI

struct PokemonListView: View {
    let pokemons: [Pokemon] = [
        Pokemon(id: 25, name: "pikachu"),
        Pokemon(id: 1, name: "bulbasaur"),
        Pokemon(id: 4, name: "charmander"),
        Pokemon(id: 7, name: "squirtle"),
        Pokemon(id: 133, name: "eevee"),
    ]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(pokemons) { pokemon in
                    PokemonItemView(pokemon: pokemon)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical, 8)
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    PokemonListView()
}
```

---

### `NetworkedApp` の変更
エントリーポイント (`NetworkedApp`) で `PokemonListView` を使うようにします。

```swift
import SwiftUI

@main
struct NetworkedApp: App {
    var body: some Scene {
        WindowGroup {
            PokemonListView()
        }
    }
}
```

---

## 🎯 Step 2 のポイント
1. **`pokemons` 配列にデータをまとめた**
   - `pokemon1` 〜 `pokemon5` のバラバラの変数を、1つの配列に整理した。
2. **`ForEach` でリストを自動生成**
   - 手書きで5つ並べていたコードが、`ForEach` で **たった数行** になった。
3. **データの追加が簡単に**
   - 新しいポケモンを追加するには、配列にデータを1行追加するだけでOK！

---

## ⏭️ 次のステップ
次のステップでは、データを **手書きではなく、APIから取得** する方法を学びます。

➡️ [Step 3 - API経由で情報を取得して表示する](./Step3.md)
