#!/bin/bash

user='vm'
passwd='0601'
local_file='/var/tmp/filecoin-proof-parameters'
remote_path='/var/tmp/'

for ip in `cat ip.txt`
do	
expect -c "
  set timeout 1800
  spawn scp -r $local_file $user@$ip:$remote_path
  expect {
      \"yes/no\" {send \"yes\r\";exp_continue;}
      \"*password\" {send \"$passwd\r\";}
    }  

expect eof"
done
