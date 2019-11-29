auto create user wit default config

#set -x

echo "####################"
echo "Created By Git.Zubur"
echo "####################"

DEF_PASS="123456"
USR_GRP="users"
SUDO_GRP="sudo"

#function to create group ubuntu
#create_grp () {
#       egrep -w "^$grp" /etc/group >/dev/null
#       [ $? -ne 0 ] && sudo groupadd "$grp" && echo "group created"
#}


#Username
read -p "Enter username :" username
egrep -w "^$username" /etc/passwd >/dev/null
[ $? -eq 0 ] && echo "$username exists!" && exit 1

#Group
read -p "Choose which group $username will be join to? `echo $'\nPress 1 for "users" or 2 for "sudo"'` " num
if [ $num -eq 1 ] ; then
        grp=$USR_GRP
elif [ $num -eq 2 ]; then
        grp="$SUDO_GRP"
else
        echo "ERROR, unsupported choise"
fi
sudo useradd -m -G "$grp" -c "auto Created" -s /bin/bash -p $(openssl passwd -1 "$DEF_PASS" ) "$username"  && chgrp "$USR_GRP" /home/"$username"/ && chage -d 0 $username
