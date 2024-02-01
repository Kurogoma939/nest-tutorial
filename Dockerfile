# Dockerfile
FROM node:21.2.0

# アプリケーションディレクトリを作成する
WORKDIR /usr/src/app

# アプリケーションの依存関係をインストールする
# ワイルドカードを使用して、package.jsonとpackage-lock.jsonの両方をコピーする
COPY package*.json ./

RUN npm install
# プロダクション用にコードをビルドする場合は、npm ci --only=productionを使用してください

# アプリケーションのソースをバンドルする
COPY . .

# アプリがバインドするポートを指定する
EXPOSE 3000

# 定義されたコマンドを実行する
CMD [ "npm", "run", "start:dev" ]
