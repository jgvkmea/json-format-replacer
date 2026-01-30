package main

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
)

func main() {
	// コマンドライン引数のチェック
	if len(os.Args) < 2 {
		fmt.Fprintf(os.Stderr, "使用方法: %s <JSONファイルパス>\n", os.Args[0])
		os.Exit(1)
	}

	// ファイルパスを取得（相対パスまたは絶対パス）
	filePath := os.Args[1]

	// 相対パスの場合は絶対パスに変換
	absPath, err := filepath.Abs(filePath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "エラー: ファイルパスの解決に失敗しました: %v\n", err)
		os.Exit(1)
	}

	// JSONファイルを読み込む
	data, err := os.ReadFile(absPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "エラー: ファイルの読み込みに失敗しました: %v\n", err)
		os.Exit(1)
	}

	// JSONをパースする
	var jsonData interface{}
	err = json.Unmarshal(data, &jsonData)
	if err != nil {
		fmt.Fprintf(os.Stderr, "エラー: JSONのパースに失敗しました: %v\n", err)
		os.Exit(1)
	}

	// JSONを整形する（インデント: 2スペース）
	formattedJSON, err := json.MarshalIndent(jsonData, "", "  ")
	if err != nil {
		fmt.Fprintf(os.Stderr, "エラー: JSONの整形に失敗しました: %v\n", err)
		os.Exit(1)
	}

	// 改行を追加
	formattedJSON = append(formattedJSON, '\n')

	// ファイルを上書き保存
	err = os.WriteFile(absPath, formattedJSON, 0644)
	if err != nil {
		fmt.Fprintf(os.Stderr, "エラー: ファイルの書き込みに失敗しました: %v\n", err)
		os.Exit(1)
	}

	fmt.Printf("JSONファイルを整形しました: %s\n", absPath)
}
