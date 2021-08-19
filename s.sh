#! /bin/bash
# `chmod 755`する必要あり
if [ $# -eq 0 ]; then
  echo '1個の引数が必要です'
elif [ $# -eq 1 ]; then
  NAME=$1
  ID=`docker ps | grep "$NAME" | awk '{print $1}'`
  echo "docker exec -it" $ID "/bin/bash"
  docker exec -it $ID /bin/bash
elif [ $# -eq 2 ]; then
  if [ $1 = 'cp' ] && [ $2 = 'gemfile' ]; then
    cp ~/portfolio/cloud_reminder/Gemfile             ~/portfolio/my_docker/cloud_reminder/
    cp ~/portfolio/cloud_reminder/Gemfile.lock        ~/portfolio/my_docker/cloud_reminder/
    cp ~/portfolio/cloud_reminder/config/unicorn.rb   ~/portfolio/my_docker/cloud_reminder/
    cp ~/portfolio/cloud_reminder/config/database.yml ~/portfolio/my_docker/cloud_reminder/
    ls -l cloud_reminder | grep Gem
  else
    echo '引数の指定が間違っています'
  fi
else
  echo '引数が多すぎます'
fi
