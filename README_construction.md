
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
docker-compose run rails_pg rails new . --force --database=postgresql
docker-compose run rails_mysql rails new . --force --database=mysql
```

## Railsの設定書き換え

### postgresql

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

### mysql

```yml:config/database.yml
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: docker-compose.ymlで設定したMYSQL_ROOT_PASSWORD
  # host: db
  socket: /run/mysqlId/mysqld.sock
  # socket: /tmp/mysql.sock
```

### 共通

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

## Gemfile

シンボリックリンクでは駄目。

```zsh
cd web_reminder
cp ~/portfolio/web_reminder/Gemfile .
cp ~/portfolio/web_reminder/Gemfile.lock .
```

## cron

ホスト側のcronを実行する

* * * * * /bin/bash -l -c 'cd ~/portfolio/my_docker && docker-compose run --rm web_reminder rails task_reminder:for_cron_test >> ~/portfolio/web_reminder/log/cron2.log 2>&1'

## unicorn

bundle exec unicorn_rails -c config/unicorn.rb -E development -D
RAILS_SERVE_STATIC_FILES=1 bundle exec unicorn_rails -c config/unicorn.rb -E production -D
