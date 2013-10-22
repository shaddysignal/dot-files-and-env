#!/bin/bash

database_command=mysql
username=root

cd /tmp/ && touch _tmpdatabasecommands
file="/tmp/_tmpdatabasecommands"
echo -e "drop procedure if exists createUser;\ndelimiter \$\$\ncreate procedure createUser(username varchar(50), pw varchar(50))\nbegin IF (SELECT EXISTS(SELECT 1 FROM \`mysql\`.\`user\` WHERE \`user\` = username)) = 0 THEN\nbegin set @sql = CONCAT('CREATE USER ', username, '@\'localhost\' IDENTIFIED BY \'', pw, '\''); prepare stmt from @sql; execute stmt; deallocate prepare stmt; end;\nEND IF;\nend \$\$\ndelimiter ;" >> $file
let _flag=-1

while read l; do
  parsed=($l);
  if [[ ${parsed[0]} =~ ^(development|production|test): ]]; then
    let _flag=3
    continue
  fi
  if [[ ${parsed[0]} =~ ^(database|password|username) ]]; then
   eval _${BASH_REMATCH[0]}=${parsed[1]}
   let _flag=$_flag-1
  fi
  if [[ $_flag == 0 ]]; then
    echo -e "call createUser('$_username', '$_password');" >> $file
    echo -e "grant all on $_database.* to '$_username'@'localhost';" >> $file
  fi
done

echo Process to database...
$database_command -u$username -p mysql < /tmp/_tmpdatabasecommands
rm /tmp/_tmpdatabasecommands
echo All done.
