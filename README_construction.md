
# rails install

## railsプロジェクト作成

```Dockerfile
# 〜
COPY Gemfile      /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
# 〜
```

```Gemfile
source 'https://rubygems.org'
gem 'rails', '6.0.0'
```

`Gemfile.lock`は空でOK

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
  password: docker-compose.ymlで設定したPOSTGRES_PASSWORD
```

```Dockerfile
# 〜
COPY ./myapp/Gemfile      /myapp/Gemfile
COPY ./myapp/Gemfile.lock /myapp/Gemfile.lock
# 〜
```
## docker実行

```zsh
docker-compose build
docker-compose up -d
docker-compose run test_app rails db:create
```
