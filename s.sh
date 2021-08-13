#! /bin/bash
# `chmod 755`する必要あり
if [ $# -eq 0 ]; then
  echo '1個の引数が必要です'
elif [ $# -eq 1 ]; then
  NAME=$1
  ID=`docker ps | grep "$NAME" | awk '{print $1}'`
  echo "docker exec -it" $ID "/bin/bash"
  docker exec -it $ID /bin/bash
else
  echo '未実装'
fi
