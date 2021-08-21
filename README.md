# Dockerを利用したインフラ構築

Dockerを利用したインフラを構成する為のリポジトリです。
ローカルではDockerComposeを利用して環境を構築しています。
アプリケーションファイルは別リポジトリで管理しています。

まずはAWSのEC2でもdocker-composeを使って環境を構築することを目的としています。
ECSとかを使用するのは今後の目標としています。

## 現在の構成

* Nginx + Rails(Unicorn) + MariaDB
* cronはホスト側のものを利用

## TODO

* AWS上で動作させる
* Let's EncryptによるSSL/TLS証明書発行の自動化

# ブランチ

* master: baseブランチで作成したイメージを元にした構成
* base  : 基礎dockerイメージの作成、テスト用

# シェルスクリプト

長いコマンドを短縮して実行する為のシェルスクリプトです。

* 実行されるコマンド
  * シェルスクリプトを利用したコマンド
  * 概要
* `docker exec -it コンテナID /bin/bash`
  * `./s.sh コンテナ名(一意に絞れるコンテナ名の一部でOK)`
  * コンテナ内に入る為のコマンド
* `docker-compose -f docker-compose.yml -f production.yml up -d`
  * `./production.sh`
  * 本番環境用のコマンド
# 構築時のメモ

構築時に試行錯誤したこと、調べた内容について記録を残しています。

[README_construction.md](https://github.com/tc-miyatani/my_docker/blob/master/README_construction.md)

