# CLAUDE.md

## Language

- レビューや回答はすべて日本語で行うこと

## Project Overview

STORES Tech Girls Camp Day 1 - iOS アプリ開発ワークショップの教材リポジトリ。
プログラミング初心者向けに SwiftUI を使った iPhone アプリ開発を体験するワークショップ。

## Repository Structure

- `docs/` - ワークショップのドキュメント（Markdown、画像）
- `SwiftBasics/` - Swift 基礎を学ぶ Playground
- `ChallengeProjects/` - 受講者が取り組むスタータープロジェクト
  - `SwiftUIChallenge/` - SwiftUI の基本 UI 構築
  - `CalculatorApp/` - 電卓アプリ
  - `NetworkedApp/` - サーバー通信アプリ
- `CompletedProjects/` - 各チャレンジの完成版（模範解答）

## Tech Stack

- Swift 6
- SwiftUI
- Xcode

## Build

```bash
# Xcode でプロジェクトを開く
open ChallengeProjects/SwiftUIChallenge/SwiftUIChallenge.xcodeproj
open ChallengeProjects/CalculatorApp/CalculatorApp.xcodeproj
open ChallengeProjects/NetworkedApp/NetworkedApp.xcodeproj

# コマンドラインビルド
xcodebuild -project ChallengeProjects/SwiftUIChallenge/SwiftUIChallenge.xcodeproj -scheme SwiftUIChallenge -destination 'platform=iOS Simulator,name=iPhone 16' build
```

## Development Guidelines

- ワークショップ教材のため、コードはシンプルさ・読みやすさを最優先する
- ChallengeProjects は受講者が穴埋め・修正して完成させる前提。ヒントやコメントを残す
- CompletedProjects は模範解答。ChallengeProjects と対応関係を保つ
- ドキュメント（`docs/`）は初心者向けの平易な日本語で記述する
- コードのコメントも日本語で記述する（初心者が理解しやすいように）
- 高度な Swift 機能（Generics、Protocol Extensions、Macros 等）は避け、基本的な構文のみ使用する

## Pull Request

- PRテンプレートがある場合は `.github/PULL_REQUEST_TEMPLATE.md` に従う
