# for: getUserInput
source utils.sh

main() #alias
{
    getUserInput "enter keyname:" "newKeyname"
    keyname=$value

    getUserInput "enter email:" "newEmail@qq.com"
    email=$value

    getUserInput "enter aliasname:" "alias.github.com"
    aliasname=$value

    getUserInput "enter hostname:" "github.com"
    hostname=$value

    # getUserInput "enter port:" "22"
    # port=$value

    getUserInput "enter username:" "git"
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
    scp ~/.ssh/id_rsa_$keyname.pub $username@$aliasname:/home/$username/.ssh
    ssh $username@$aliasname "cat /home/$username/.ssh/id_rsa_$keyname.pub >> /home/$username/.ssh/authorized_keys" 

    echo "eg. git clone $username@$aliasname:NenX/frequently-used-scripts.git"
    echo "or ssh $username@$aliasname"
}
 

main;