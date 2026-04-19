# 学習用AIエージェント セットアップガイド

このガイドに従って設定すると、プログラミング学習をサポートしてくれるAIエージェントが使えるようになります。
**Claude Code・Cursor・Google Antigravity** のいずれかひとつを選んでセットアップしてください。

---

## 1. 学習キットのダウンロード

```bash
git clone https://github.com/koki-kato/ai-learning-kit.git my-learning
cd my-learning
```

または GitHub の **「Code」→「Download ZIP」** でダウンロードして展開。

---

## 2. AIツールのインストール（3択）

使いたいツールを1つ選んでセットアップしてください。

---

### 選択肢A: Claude Code（ターミナル型）

#### ① Node.js のインストール

1. [nodejs.org](https://nodejs.org/) にアクセス
2. **LTS版**（左側のボタン）をダウンロード・インストール
3. 確認:
   ```bash
   node --version
   ```
   → `v20.x.x` のようにバージョンが表示されればOK

#### ② Claude Code のインストール

```bash
npm install -g @anthropic-ai/claude-code
```

確認:
```bash
claude --version
```

#### ③ アカウント認証

1. ターミナルで `claude` と入力して Enter
2. ブラウザが開くので、Anthropic アカウントでログイン
3. 認証完了後、ターミナルに戻って `/exit` で一旦終了

#### ④ 起動

```bash
cd my-learning
claude
```

ルールは自動で読み込まれます（`CLAUDE.md` + `.claude/rules/`）。

---

### 選択肢B: Cursor（GUI エディタ型）

#### ① Cursor のインストール

1. [cursor.com](https://www.cursor.com/) にアクセス
2. **「Download」** からインストーラーをダウンロード
3. インストーラーを実行

#### ② アカウント登録

1. Cursor を起動
2. 画面の指示に従って Cursor アカウントでサインイン（GitHub アカウントでも可）

#### ③ フォルダを開く

1. Cursor を起動
2. **File → Open Folder** でダウンロードした `my-learning` フォルダを開く
3. AIチャット（右側パネル）に話しかけるだけでOK

ルールは自動で読み込まれます（`.cursor/rules/*.mdc`）。

---

### 選択肢C: Google Antigravity（GUI エディタ型）

#### ① Google Antigravity のインストール

1. [antigravity.google](https://antigravity.google/) にアクセス
2. **「Download」** からインストーラーをダウンロード
3. インストーラーを実行

#### ② アカウント認証

1. Google Antigravity を起動
2. Google アカウントでサインイン

#### ③ フォルダを開く

1. Google Antigravity を起動
2. フォルダを開く で `my-learning` フォルダを選択
3. AIエージェントパネルに話しかけるだけでOK

ルールは自動で読み込まれます（`GEMINI.md` + `.agent/rules/`）。

---

## 3. 使ってみよう

どのツールを選んでも、AIへの話しかけ方は同じです。

### 基本操作

| 操作 | Claude Code | Cursor / Antigravity |
|------|-------------|----------------------|
| 質問する | テキストを打って Enter | チャットパネルに入力 |
| ファイルを見せる | 「index.html を読んで」 | ファイルを開いた状態で質問 |
| 終了する | `/exit` または Ctrl+C | ウィンドウを閉じる |

### 使い方の例

ルールは自動で有効になるので、特別なコマンドは不要です。

#### コードの解説を頼む
```
index.html のコードを解説して
```
→ 1行ずつ解説し、公式ドキュメントのURLも添えてくれます。

#### エラーを相談する
```
エラーが出て動かない
```
→ 答えをすぐ書かず、3段階のヒントで自分で考えられるように導いてくれます。

#### 課題に取り組む
```
じゃんけんゲームを作りたい
```
→ 小さなステップに分解して、1つずつ進めてくれます。
→ `learning-records/` に進捗管理用のMDファイルも自動で作成されます。

---

## 4. ルールの説明

### ルール = AIが常に守る行動指針

各ツール用のルールフォルダに入っているファイルが、AIの行動ルールです。
起動するたびに自動で読み込まれます。

| ファイル | 内容 |
|---------|------|
| `teaching.md` | 日本語で回答、考え方→ヒント→コードの順で教える |
| `hint.md` | 答えを書かず3段階のヒントで導く |
| `reference-docs.md` | 公式ドキュメントのURLを根拠に説明する |
| `learning-record.md` | 学習記録の保存・進捗管理・チャット表示ルール |

### ツール別のルールファイルの場所

| ツール | ルールファイルの場所 |
|--------|------------------|
| Claude Code | `.claude/rules/*.md` |
| Cursor | `.cursor/rules/*.mdc` |
| Google Antigravity | `.agent/rules/*.md` |

---

## 5. 困ったとき

### Claude Code: `claude: command not found`
→ Node.js のインストールからやり直してください

### Cursor / Antigravity: ルールが効いていない気がする
→ ツールを再起動してみてください
→ ルールフォルダが正しい場所にあるか確認してください

### 認証画面が出ない（Claude Code）
→ ブラウザを手動で開いて claude.ai にアクセスしてください

### その他
→ 講師に聞いてください
