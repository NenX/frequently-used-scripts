#!/usr/bin/env bash

currentDir=`dirname $0`
cd $currentDir

# for: get_user_input
source utils/index.sh

main() #alias
{
    get_user_input "enter keyname:" "from_`cat /etc/hostname`_key1"
    filename=id_rsa_server_$value

    get_user_input "enter email:" "newEmail@qq.com"
    email=$value

    get_user_input "enter aliasname:" "alias_server1"
    aliasname=$value

    get_user_input "enter hostname:" "192.168.1.1"
    hostname=$value

    if file_contains ~/.ssh/config $hostname
    then
        echoRed "error: host $hostname already exists!!!"
        exit 1
    fi
    # get_user_input "enter port:" "22"
    # port=$value

    get_user_input "enter username:" "root"
    username=$value

    ssh-keygen -t rsa -C $email -f "$HOME/.ssh/$filename"
    
    echo -e "\n
Host $aliasname
    HostName $hostname
    # Port $port
    User $username
    IdentityFile ~/.ssh/$filename" >> ~/.ssh/config
    
    if test $username = "root"; then
        homePath="/root"
    else
        homePath="/home/$username"
    fi

    # remote: vi /etc/ssh/sshd_config && StrictModes --> no && service sshd restart
    # remote: useradd -g noah -G root -m noah
    scp ~/.ssh/$filename.pub $username@$aliasname:$homePath/.ssh
    ssh $username@$aliasname "cat $homePath/.ssh/$filename.pub >> $homePath/.ssh/authorized_keys" 

    echoBlue "fetching files testing:"
    ssh $username@$aliasname "ls -lah ~/.ssh"

    echoGreen "usage: ssh $username@$aliasname"
}
 

main;