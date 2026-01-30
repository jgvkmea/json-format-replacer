.PHONY: build clean install test run help

# バイナリ名
BINARY_NAME=json-format-replacer

# デフォルトターゲット
.DEFAULT_GOAL := help

## help: ヘルプメッセージを表示
help:
	@echo "利用可能なコマンド:"
	@echo "  make build     - バイナリをビルド"
	@echo "  make clean     - ビルド成果物を削除"
	@echo "  make install   - バイナリを \$$GOPATH/bin にインストール"
	@echo "  make test      - テストを実行"
	@echo "  make run       - プログラムを実行（例: make run ARGS=sample.json）"
	@echo "  make fmt       - コードフォーマット"
	@echo "  make vet       - コード解析"

## build: バイナリをビルド
build:
	@echo "ビルド中..."
	go build -o $(BINARY_NAME) .
	@echo "ビルド完了: $(BINARY_NAME)"

## clean: ビルド成果物を削除
clean:
	@echo "クリーンアップ中..."
	go clean
	rm -f $(BINARY_NAME)
	@echo "クリーンアップ完了"

## install: バイナリを $GOPATH/bin にインストール
install:
	@echo "インストール中..."
	go install
	@echo "インストール完了"

## test: テストを実行
test:
	@echo "テスト実行中..."
	go test -v ./...

## run: プログラムを実行（ARGS変数でファイルパスを指定）
run: build
	./$(BINARY_NAME) $(ARGS)

## fmt: コードフォーマット
fmt:
	@echo "コードフォーマット中..."
	go fmt ./...

## vet: コード解析
vet:
	@echo "コード解析中..."
	go vet ./...

## all: フォーマット、解析、ビルドを実行
all: fmt vet build
	@echo "すべての処理が完了しました"
