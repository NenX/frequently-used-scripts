# for: getUserInput
source utils/index.sh

main() #alias
{
    getUserInput "enter keyname:" "from_`cat /etc/hostname`_key1"
    filename=id_rsa_server_$value

    getUserInput "enter email:" "newEmail@qq.com"
    email=$value

    getUserInput "enter aliasname:" "alias_server1"
    aliasname=$value

    getUserInput "enter hostname:" "192.168.1.1"
    hostname=$value

    # getUserInput "enter port:" "22"
    # port=$value

    getUserInput "enter username:" "root"
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