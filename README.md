# Start Dash

---

※ この項は start-dash リポジトリの説明なのでプロジェクトで使うときは削除してください。 ここから

---

こちらは[株式会社StartupTechnology](http://startup-technology.com/)の開発において、Webアプリ開発の初期にスタートダッシュをかけるために、初期設定を行ったRailsテンプレートです。
こちらをベースに各自の開発に合った形で調整を行ってください。

## Features

### 日本語設定

- config/initializers/locales.rb

### アプリケーションサーバー

- Puma

### デプロイ

- capistrano

### ユーザー認証

- sorcery
- pundit

### テンプレートエンジン

- erb
- simple_form

### Decorator

- active_decorator

### フロントエンド

- Webpack
- Babel
- React

ディレクトリ構成

```
frontend
└── assets
    └── javascripts
        ├── application.js
        └── components
            └── hello.jsx

config/frontend
├── development
│   └── webpack.config.js
└── production
    └── webpack.config.js
```

### CSSフレームワーク

- Bootstrap3(Sass)
- Fontawesome

### アップロード

- carrierwave

### バックグラウンドジョブ

- resque

### コード解析

- Rubocop
- Reek
- Rails Best Practices
- Brakeman
- Bullet
- Coffeelint
- SCSS-Lint

### その他

- EditorConfig
- See `Gemfile`.

---

※ この項は start-dash リポジトリの説明なのでプロジェクトで使うときは削除してください。 ここまで

---

## Ruby version

- See `.ruby-version`.

## Rails version

- See `Gemfile`.

## System dependencies

- MySQL >= 5.5
- Redis

## Project initiation

- リポジトリのクローン

```bash
$ git@github.com:startup-technology/start-dash.git
```

- Gemのインストール

```bash
$ bundle install --path vendor/bundle
```

- npmのインストール

```bash
$ npm install
```

### Configuration

*ファイルの中身はご自身の環境に合わせて適宜変更してください*

- データベースの設定

```bash
$ cp config/database.yml.default config/database.yml
```

- 環境変数の設定

```bash
$ cp .env.default .env
```

*AWSのアクセスキーなどは個別に担当者に聞いてください。*

### Database creation

```bash
$ rake db:create db:migrate
```

### Database initialization

```bash
$ rake db:seed_fu
```

## Run rails server

```bash
$ bundle exec rails server
```

## Run active job

```bash
$ bundle exec rake resque:work
```

## Webpacker

JavaScriptのコンパイル

```
$ ./bin/webpack
```

サーバーの起動

```
$ ./bin/webpack-dev-server
```

```bash
$ spring rspec spec/[対象ファイル]
```

## How to run the static code analysis

### Rubocop

```bash
$ bundle exec rubocop -R
```

### Reek

```bash
$ bundle exec reek
```

### Rails best practices

```bash
$ bundle exec rails_best_practices
```

### Brakeman

```bash
$ bundle exec brakeman
```

### ESLint

```bash
$ rake eslint:run
```

### SCSS-Lint

```bash
$ bundle exec scss-lint
```

### Slim-Lint

```bash
$ bundle exec slim-lint
```

## EditorConfig

-  ご自身のエディタに[EditorConfig](http://editorconfig.org/)のインストールをお願いします。

## CI as a service

- [CircleCI](https://circleci.com/)
- [SideCI](https://www.sideci.com)
  - SideCIの運用方針は[こちら](https://github.com/startup-technology/sideci-docs)をご覧下さい。

## Development controller

### Force login

- See `app/controllers/development/sessions_controller.rb`

```
/login_as/[user_id]
```

### Letter opener web

```
/letter_opener
```

## Development tasks

### Reset database

- Execute db:drop, db:db:create, db:migrate, db:seed_fu
- See `lib/tasks/db/rest_all.rake`

```bash
$ rake db:reset_all
```
