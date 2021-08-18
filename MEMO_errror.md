
# cronでdocker-composeコマンド

エラー内容: `the input device is not a TTY`

```bash
# cron上で実行されるとエラーが出るコマンド
docker-compose exec cloud_reminder rails task_reminder:for_cron_test
# エラー解消: `-T`を付ければOK
docker-compose exec -T cloud_reminder rails task_reminder:for_cron_test
```
# rails + mysql

## Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)

### 解決策1. socketファイルの共有、設定
`/tmp/mysql.sock`ファイルが無いとエラーが出る。
socketファイルの場所を共有ボリュームにして、railsの`config/database.yml`でsocketパスを指定すれば接続できる
mariadbコンテナの`/run/mysqld/mysqld.sock`で接続できる
mariadbコンテナの`/var/lib/mysql/mysql.sock`では接続できない。

### 解決策2. socketファイルではなくportで接続 (うまくいかない)

`/etc/mysql/my.cnf`に設定が記載されている。
以下ディレクトリ内に設定ファイルを置くと、この設定は**上書き**できる。

```my.cnf
!includedir /etc/mysql/mariadb.conf.d/
!includedir /etc/mysql/conf.d/
```

```/etc/mysql/conf.d/rails.conf
[client-server]
port = 3306
# socket = /run/mysqld/mysqld.sock
```

Host '192.168.112.3' is not allowed to connect to this MariaDB server
うまくいかない

### dockerコンテナについて

mariadbコンテナ内の各ファイルの場所
/run/mysqld/mysqld.sock
/etc/mysql/my.cnf -> /etc/alternatives/my.cnf
/etc/my.cnf.d/server.cnf
/var/log/mysql/mysqld.log
mariadbコンテナを単体で稼働させてコンテナに入る方法
docker run --rm -e MARIADB_ROOT_PASSWORD=XXXXX -d mariadb
docker exec -it XXXX /bin/bash
mysql -u root -pXXXXX

