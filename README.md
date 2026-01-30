# JSON Format Replacer

JSONファイルを読み込んで整形し、元のファイルを上書きするGoツールです。

## 機能

- コマンドライン引数でJSONファイルパスを指定
- 相対パスまたは絶対パスに対応
- JSONファイルを読み取り、整形（インデント: 2スペース）
- 元のファイルを整形後のJSONで上書き

## インストール

### Makeを使用する場合（推奨）

```bash
# /usr/local/bin にインストール
make install

# または、$GOPATH/bin にインストール
make install-local
```

### 手動でビルドする場合

```bash
# ビルドのみ
make build

# または go コマンドで直接ビルド
go build -o json-format-replacer
```

## アンインストール

```bash
make uninstall
```

## 使用方法

インストール後は、どこからでもコマンドを実行できます：

```bash
# 相対パスを指定
json-format-replacer path/to/file.json

# 絶対パスを指定
json-format-replacer /absolute/path/to/file.json
```

ビルドのみの場合：

```bash
./json-format-replacer path/to/file.json
```

## 使用例

```bash
# カレントディレクトリのdata.jsonを整形
json-format-replacer data.json

# サブディレクトリのJSONファイルを整形
json-format-replacer ./configs/settings.json

# 絶対パスで指定
json-format-replacer /path/to/settings.json
```

## Makeコマンド一覧

```bash
make help          # ヘルプメッセージを表示
make build         # バイナリをビルド
make clean         # ビルド成果物を削除
make install       # /usr/local/bin にインストール（要sudo）
make install-local # $GOPATH/bin にインストール
make uninstall     # /usr/local/bin からアンインストール（要sudo）
make test          # テストを実行
make run           # プログラムを実行（例: make run ARGS=sample.json）
make fmt           # コードフォーマット
make vet           # コード解析
make all           # フォーマット、解析、ビルドを一括実行
```

## エラーハンドリング

以下の場合はエラーメッセージを表示して終了します：

- ファイルパスが指定されていない
- ファイルの読み込みに失敗
- JSONのパースに失敗（不正なJSON形式）
- ファイルの書き込みに失敗
