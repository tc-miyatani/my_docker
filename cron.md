
# cron

このcronの内容をホスト側に設定して使用する。  
(設定方法: `crontab -e`, 確認方法: `crontab -l`)

```bash
# CloudReminder用 1分毎
* * * * * /bin/bash -l -c 'cd ~/portfolio/my_docker && docker-compose exec -T cloud_reminder rails task_reminder:for_cron_test >> ~/portfolio/web_reminder/log/cron.log 2>&1'

# Let's Encrypt用
# TODO: nginxコンテナ内にcertbotをインストールして`docker-compose exec`で定期実行する

```
