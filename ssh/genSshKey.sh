getValue()
{
    read -p "$1" value
    value=${value:=$2}
    echo "value is $value"
}
main() #alias
{
    getValue "enter keyname:" "newKeyname"
    keyname=$value

    getValue "enter email:" "newEmail@qq.com"
    email=$value

    getValue "enter aliasname:" "alias.github.com"
    aliasname=$value

    getValue "enter hostname:" "github.com"
    hostname=$value

    # getValue "enter port:" "22"
    # port=$value

    getValue "enter username:" "git"
    username=$value

    ssh-keygen -t rsa -C $email -f "$HOME/.ssh/id_rsa_$keyname"
    
    echo -e "\n
Host $aliasname
    HostName $hostname
    # Port $port
    User $username
    IdentityFile ~/.ssh/id_rsa_$keyname" >> ~/.ssh/config
    #
    # remote: vi /etc/ssh/sshd_config && StrictModes --> no && service sshd restart
    # remote: useradd -g lamp1 -G root -m noah
    scp ~/.ssh/id_rsa_$keyname.pub $username@$aliasname:/home/username/.ssh
    echo "eg. git clone $username@$aliasname:NenX/frequently-used-scripts.git"
    echo "or ssh $username@$aliasname"
}
 

main;