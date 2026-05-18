# 🌐 ワークショップ: サーバーと通信するモバイルアプリを作ってみよう！

このワークショップでは、ネットワーク通信を利用してデータを取得し、アプリに表示する機能を実装します。  
SwiftUI を使い、PokeAPI からポケモンのデータを取得し、それをリスト表示するポケモン図鑑アプリを作成します。

<img width="300" src="images/08_networked_app.png">

---

## 目標
- **サーバーと通信するアプリの仕組みを理解する**  
- **SwiftUI を使ってリスト表示を作成する**  
- **ForEach を使って動的にデータを表示する**  
- **URLSession を使って API からデータを取得する**  
- **取得したデータを Swift の構造体にマッピングする**  
- **画面遷移やタブを利用してアプリを整理する**

---

## プロジェクトの構成

このワークショップでは、スタート用のプロジェクトを **ChallengeProjects** に、完成版の解答例を **CompletedProjects** に用意しています。

```
📁 ChallengeProjects/
  ├── 📂 NetworkedApp/                      # ワークショップのベースプロジェクト
  │   ├── NetworkedApp.xcodeproj
  │   ├── NetworkedApp/
  │   │   ├── NetworkedApp.swift          # アプリのエントリーポイント
  │   │   ├── PokemonListView.swift      # ポケモンのリスト画面
  │   │   ├── PokemonItemView.swift      # 1つのポケモンアイテムのビュー
  │   │   ├── PokemonDetailView.swift    # ポケモン詳細画面（未実装）
  │   │   ├── MainTabView.swift          # タブ画面（未実装）
  │   │   ├── Pokemon.swift              # ポケモンデータの構造体
  │   │   ├── Assets.xcassets/           # アセット管理
  │   ├── Documents/
  │   │   ├── Step0.md                   # Step 0 の説明資料
  │   │   ├── Step1.md                   # Step 1 の説明資料
  │   │   ├── Step2.md                   # Step 2 の説明資料
  │   │   ├── Step3.md                   # Step 3 の説明資料
  │   │   ├── Step4.md                   # Step 4 の説明資料
  │   │   ├── Step5.md                   # Step 5 の説明資料
  │
📁 CompletedProjects/
  ├── 📂 NetworkedApp/                   # 完成したプロジェクト
  │   ├── NetworkedApp.xcodeproj
  │   ├── NetworkedApp/
```

---

## プロジェクトの起動

まず、スタート用のプロジェクトを開いてみましょう。

### 1. Xcode でプロジェクトを開く
以下の手順で Xcode を起動します。

Finder で `ChallengeProjects/NetworkedApp/` を開いて、  
`NetworkedApp.xcodeproj` をダブルクリックしてください。

もしくはターミナルを開いて以下のコマンドを入力してください。


```sh
open ChallengeProjects/NetworkedApp/NetworkedApp.xcodeproj
```

---

## ワークショップの流れ

このワークショップでは、以下の流れでアプリを完成させます。

### Step 0: ベースコードを確認しよう
- プロジェクトのフォルダ構成を確認する。
- どのファイルが何をするのかを把握する。
- すでに書かれているコードを実行してみる。

➡️ [Step 0 - ベースコードを確認しよう](../ChallengeProjects/NetworkedApp/NetworkedApp/Documents/Step0.md)

---

### Step 1: アイテムセルを複数個縦に並べる
- `ScrollView` と `LazyVStack` を使って、ポケモンアイテムを複数並べる。
- データは直接コードに書いて（ハードコーディング）、リストの基本を理解する。

➡️ [Step 1 - アイテムセルを複数個縦に並べる](../ChallengeProjects/NetworkedApp/NetworkedApp/Documents/Step1.md)

---

### Step 2: ForEach を使ってリストを整理する
- `ForEach` を使って、リストをシンプルにする。
- 配列データを作成し、ForEach で動的に表示する。

➡️ [Step 2 - ForEach を使ってリストを整理する](../ChallengeProjects/NetworkedApp/NetworkedApp/Documents/Step2.md)

---

### Step 3: API からデータを取得する
- `URLSession` を使い、PokeAPI からデータを取得する。
- 取得した JSON を `PokemonListItem` 構造体に変換する。

➡️ [Step 3 - API からデータを取得する](../ChallengeProjects/NetworkedApp/NetworkedApp/Documents/Step3.md)

---

### Step 4: 画面遷移を実装する
- `NavigationStack` と `NavigationLink` を使って、ポケモンの詳細画面を表示する。

➡️ [Step 4 - 画面遷移を実装する](../ChallengeProjects/NetworkedApp/NetworkedApp/Documents/Step4.md)

---

### Step 5: タブをつける
- `TabView` を利用して、リスト画面とお気に入り画面を切り替えられるようにする。
- タブのアイコンを設定し、使いやすい UI にする。

➡️ [Step 5 - タブをつける](../ChallengeProjects/NetworkedApp/NetworkedApp/Documents/Step5.md)

---

## 完成版プロジェクト

すべてのステップが完了したら、完成版のプロジェクトを確認してみましょう。  
完成版のプロジェクトは `CompletedProjects/NetworkedApp/` に用意されています。

```sh
open CompletedProjects/NetworkedApp/NetworkedApp.xcodeproj
```

自分のコードと比較して、実装の違いを学んでみましょう。

---

## もっとやってみよう

このワークショップが終わったら、さらにアプリを改良してみましょう。

- **無限スクロールを実装する**
  PokeAPI のレスポンスには `next` フィールドがあり、次のページのURLが入っています。リストの一番下までスクロールしたら、次の50匹を追加で読み込むようにしてみましょう。
- **別の API を試す**  
  例: 天気予報 API、ニュース API、映画データ API など
- **デザインを変えてみる**  
  例: セルのデザインを変更する、ポケモンのタイプに応じて色を変える
- **データを保存してみる**  
  例: `SwiftData` を使って、お気に入りのポケモンを永続化する

お疲れ様でした！ 🎉

## 今後について

➡️ [次へ: 📚 さらに学んでみたい人へ](./09_further.md)
