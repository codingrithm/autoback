# 使用するベースイメージ
FROM golang:1.21 AS build

# ワークディレクトリを設定
WORKDIR /app

# Goの依存関係ファイルをコピー
COPY . .

# Goの依存関係をダウンロード
RUN go mod download

# Airをインストール
RUN go install github.com/cosmtrek/air@latest

# アプリケーションを起動 (Airでホットリロードを有効化)
CMD ["air"]
