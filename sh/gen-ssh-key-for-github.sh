#!/usr/bin/env bash

currentDir=`dirname $0`
cd $currentDir

# for: get_user_input echoBLue echoGreen
source utils/index.sh

main()
{
    get_user_input "enter keyname:" "from_`cat /etc/hostname`_key1"
    filename=id_rsa_git_$value

    get_user_input "enter email:" "newEmail@qq.com"
    email=$value

    get_user_input "enter aliasname:" "github.com"
    aliasname=$value

    get_user_input "enter hostname:" "github.com"
    hostname=$value

    # get_user_input "enter port:" "22"
    # port=$value

    ssh-keygen -t rsa -C $email -f "$HOME/.ssh/$filename"
    
    echo -e "\n
Host $aliasname
    HostName $hostname
    # Port $port
    User git
    IdentityFile ~/.ssh/$filename" >> ~/.ssh/config

    echoBlue "append the following pub key to your GitHub SSH keys:"

    cat ~/.ssh/$filename.pub

    echoGreen "useage: git clone git@$aliasname:NenX/frequently-used-scripts.git"

}
 

main;