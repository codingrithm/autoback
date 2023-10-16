# 使用するベースイメージ
FROM golang:1.21 AS build

# ワークディレクトリを設定
WORKDIR /app

# Goのソースコードをコピー
COPY . .

# Goのアプリケーションをビルド
RUN CGO_ENABLED=0 GOOS=linux go build -o myapp

# ランタイムステージ
FROM scratch

# ビルドしたバイナリをコピー
COPY --from=build /app/myapp /myapp

# アプリケーションを起動
CMD ["/myapp"]
