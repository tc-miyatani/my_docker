
# rails install

## railsプロジェクト作成

```zsh
docker-compose run test_app rails new . --force --database=postgresql
```

## Railsの設定書き換え

```Gemfile
gem 'pg', '~> 0.20'
```

```yml:config/database.yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password:
```

## docker実行

```zsh
docker-compose run test_app bundle install
docker-compose build
docker-compose up -d
docker-compose run test_app rails db:create

```
