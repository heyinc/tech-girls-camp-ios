# 🏗 SwiftUIの基本を学ぼう

このセクションでは、SwiftUIの基本的なレイアウトを学びます。  
SwiftUIを使うと、簡単にUIを構築できます。  
ここでは、複数の要素を配置するためのレイアウトコンテナを使って、  
実際にコードを書きながら学んでいきます。

---

## 🎯 目標
- SwiftUIの基本的なレイアウトを理解する  
- VStack, HStack, ZStack の使い方を学ぶ  
- 画面に複数の要素を配置する方法を実践する  

---

## 📚 SwiftUIのレイアウトコンテナ

SwiftUIでは、画面の要素を並べるために  
**VStack（垂直）、HStack（水平）、ZStack（重ねる）** の3つのレイアウトコンテナを使います。

---

## 🏗 VStack（縦に並べる）

`VStack` は、画面の要素を **縦に** 並べるためのコンテナです。

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("上のテキスト")
            Text("下のテキスト")
        }
    }
}
```

- VStack の中に `Text()` を2つ配置すると、**縦に並ぶ**
- `VStack { ... }` の中に複数のビューを入れることで、簡単にレイアウトできる

### 間隔を調整する
`spacing` を指定すると、要素の間隔を変更できます。

```swift
VStack(spacing: 20) {
    Text("上のテキスト")
    Text("下のテキスト")
}
```

---

## 🏗 HStack（横に並べる）

`HStack` は、画面の要素を **横に** 並べるためのコンテナです。

```swift
struct ContentView: View {
    var body: some View {
        HStack {
            Text("左")
            Text("中央")
            Text("右")
        }
    }
}
```

- `HStack` を使うと、要素が **水平方向に並ぶ**
- `VStack` と組み合わせてレイアウトを作ることが多い

### 間隔を調整する
`spacing` を使って、要素の間隔を調整できます。

```swift
HStack(spacing: 30) {
    Text("左")
    Text("中央")
    Text("右")
}
```

---

## 🏗 ZStack（重ねて配置）

`ZStack` は、要素を **重ねる** ためのコンテナです。

```swift
struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 100)
            Text("前面のテキスト")
                .foregroundColor(.white)
        }
    }
}
```

- `ZStack` の中にあるビューは **上から順に** 配置される
- **背景とテキスト** のように、要素を重ねたいときに使う

### 配置を調整する
`alignment` を指定すると、要素を揃えることができる。

```swift
ZStack(alignment: .topLeading) {
    Rectangle()
        .fill(Color.green)
        .frame(width: 200, height: 100)
    Text("左上")
        .foregroundColor(.white)
}
```

---

## 📌 VStack, HStack, ZStack の組み合わせ

実際のアプリでは、**VStack, HStack, ZStack を組み合わせて** レイアウトを作ります。  
例えば、以下のコードは **タイトル、横並びのボタン、背景のあるレイアウト** を作る例です。

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("タイトル")
                .font(.largeTitle)
            
            HStack {
                Text("左")
                Text("右")
            }
            .padding()
            .background(Color.yellow)
            .cornerRadius(10)
            
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 200, height: 100)
                Text("前面")
                    .foregroundColor(.white)
            }
        }
    }
}
```

---

## ✅ まとめ
- `VStack` を使うと **縦に並べる**  
- `HStack` を使うと **横に並べる**  
- `ZStack` を使うと **重ねて配置する**  
- それぞれを **組み合わせることで、自由にレイアウトが作れる**  

次のステップでは、実際にコードを書いてレイアウトを組む課題に挑戦します。

➡️ [次へ: SwiftUI Challenge](./05_swiftui_challenge.md)
