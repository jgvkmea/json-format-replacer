.PHONY: build clean install install-local uninstall test run help

# バイナリ名
BINARY_NAME=json-format-replacer

# インストール先
INSTALL_PATH=/usr/local/bin

# デフォルトターゲット
.DEFAULT_GOAL := help

## help: ヘルプメッセージを表示
help:
	@echo "利用可能なコマンド:"
	@echo "  make build         - バイナリをビルド"
	@echo "  make clean         - ビルド成果物を削除"
	@echo "  make install       - バイナリを $(INSTALL_PATH) にインストール（要sudo）"
	@echo "  make install-local - バイナリを \$$GOPATH/bin にインストール"
	@echo "  make uninstall     - $(INSTALL_PATH) からアンインストール（要sudo）"
	@echo "  make test          - テストを実行"
	@echo "  make run           - プログラムを実行（例: make run ARGS=sample.json）"
	@echo "  make fmt           - コードフォーマット"
	@echo "  make vet           - コード解析"

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

## install: バイナリを /usr/local/bin にインストール
install: build
	@echo "$(INSTALL_PATH) にインストール中..."
	sudo cp $(BINARY_NAME) $(INSTALL_PATH)/$(BINARY_NAME)
	sudo chmod +x $(INSTALL_PATH)/$(BINARY_NAME)
	@echo "インストール完了: $(INSTALL_PATH)/$(BINARY_NAME)"

## install-local: バイナリを $GOPATH/bin にインストール
install-local:
	@echo "$GOPATH/bin にインストール中..."
	go install
	@echo "インストール完了"

## uninstall: /usr/local/bin からアンインストール
uninstall:
	@echo "$(INSTALL_PATH) からアンインストール中..."
	sudo rm -f $(INSTALL_PATH)/$(BINARY_NAME)
	@echo "アンインストール完了"

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
