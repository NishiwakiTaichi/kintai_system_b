# AI学習キット

プログラミング学習をサポートするAIエージェント設定キットです。

**Claude Code・Cursor・Google Antigravity** にルールを設定して、**AIを自分だけの先生**にします。

## 何が入っている？

### ルール = AIの行動指針

以下の4つのルールが**常に有効**になります。

| ルールファイル | 内容 |
|--------------|------|
| `teaching.md` | 教え方の基本（日本語で回答、考え方→ヒント→コードの順で教える） |
| `hint.md` | ヒントベース教育（答えを書かず3段階のヒントで導く） |
| `reference-docs.md` | 公式ドキュメント参照（URLを根拠に説明する） |
| `learning-record.md` | 学習記録（進捗管理、詳細な説明の保存、チャット表示ルール） |

### 対応ツール

| ツール | 設定ファイルの場所 |
|--------|-----------------|
| **Claude Code** | `CLAUDE.md` + `.claude/rules/` |
| **Cursor** | `.cursor/rules/`（`.mdc` 形式） |
| **Google Antigravity** | `GEMINI.md` + `.agent/rules/` |

## セットアップ

### キットの入手

```bash
git clone https://github.com/koki-kato/ai-learning-kit.git my-learning
cd my-learning
```

または GitHub の **「Code」→「Download ZIP」** でダウンロードして展開。

### ツール別の起動方法

#### Claude Code
```bash
# Node.js と Claude Code が必要
npm install -g @anthropic-ai/claude-code
claude
```

#### Cursor
1. [cursor.com](https://www.cursor.com/) からダウンロード・インストール
2. Cursor でフォルダを開く（File → Open Folder）
3. `.cursor/rules/` が自動で読み込まれます

#### Google Antigravity
1. [antigravity.google](https://antigravity.google/) からダウンロード・インストール
2. Antigravity でフォルダを開く
3. `GEMINI.md` と `.agent/rules/` が自動で読み込まれます

## 使い方

どのツールでも、フォルダを開いてAIに話しかけるだけです。

### 普通に質問する
```
JavaScriptで変数を作る方法を教えて
```
→ 考え方を説明 → ヒントを出す → コードを見せる、の順で教えてくれます。

### エラーを聞く
```
このエラーの意味が分からない
```
→ エラーの意味 → 原因 → ヒントの順で説明し、公式ドキュメントのURLも添えてくれます。

### 課題に取り組む
```
じゃんけんゲームを作りたい
```
→ 自動でステップに分解し、進捗管理用のMDファイルを作成。1ステップずつ導いてくれます。

## ファイル構成

```
my-learning/
├── README.md                  ← このファイル
├── CLAUDE.md                  ← Claude Code 用ルール概要
├── GEMINI.md                  ← Google Antigravity 用ルール概要
├── learning-records/          ← 学習記録（課題ごとに自動作成）
│   └── <課題名>/
│       ├── progress.md        ← 進捗チェックリスト
│       └── phase1/step_1/
│           ├── lesson.md      ← 詳細説明
│           └── code/          ← コード例
├── .claude/
│   └── rules/                 ← Claude Code 用ルール
│       ├── teaching.md
│       ├── hint.md
│       ├── reference-docs.md
│       └── learning-record.md
├── .cursor/
│   └── rules/                 ← Cursor 用ルール（.mdc 形式）
│       ├── teaching.mdc
│       ├── hint.mdc
│       ├── reference-docs.mdc
│       └── learning-record.mdc
└── .agent/
    └── rules/                 ← Google Antigravity 用ルール
        ├── teaching.md
        ├── hint.md
        ├── reference-docs.md
        └── learning-record.md
```

## 困ったとき

| 症状 | 対処法 |
|------|--------|
| `claude: command not found` | Node.js → Claude Code の順にインストール |
| Cursor でルールが効かない | `.cursor/rules/` フォルダの場所を確認 |
| Antigravity でルールが効かない | `GEMINI.md` と `.agent/rules/` の場所を確認 |
| その他 | 講師に聞いてください |
