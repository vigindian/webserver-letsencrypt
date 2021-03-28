#!/bin/bash

CURR=$(pwd)
#prereq
cd ${HOME}
git clone https://github.com/lukas2511/dehydrated.git
cp ${CURR}/domains.txt ${CURR}/config ${CURR}/hook.sh $HOME/dehydrated/

#cd ${HOME}/dehydrated
#new priv-key
${HOME}/dehydrated/dehydrated --register --accept-terms
if [ $? -eq 0 ];then
  #gen cert
  ${HOME}/dehydrated/dehydrated -c
else
  echo "ERR: registering new key with letsencrypt failed!"
  exit 1
fi

echo "Add below line to crontab of ${UID}"
echo "0 1 1 * * ~/dehydrated/dehydrated -c"
