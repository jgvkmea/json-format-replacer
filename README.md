# JSON Format Replacer

JSONファイルを読み込んで整形し、元のファイルを上書きするGoツールです。

## 機能

- コマンドライン引数でJSONファイルパスを指定
- 相対パスまたは絶対パスに対応
- JSONファイルを読み取り、整形（インデント: 2スペース）
- 元のファイルを整形後のJSONで上書き

## インストール

```bash
go build -o json-format-replacer
```

## 使用方法

```bash
# 相対パスを指定
./json-format-replacer path/to/file.json

# 絶対パスを指定
./json-format-replacer /absolute/path/to/file.json
```

## 例

```bash
# カレントディレクトリのdata.jsonを整形
./json-format-replacer data.json

# サブディレクトリのJSONファイルを整形
./json-format-replacer ./configs/settings.json
```

## エラーハンドリング

以下の場合はエラーメッセージを表示して終了します：

- ファイルパスが指定されていない
- ファイルの読み込みに失敗
- JSONのパースに失敗（不正なJSON形式）
- ファイルの書き込みに失敗
